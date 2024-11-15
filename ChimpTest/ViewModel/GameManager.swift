//
//  Game.swift
//  ChimpTest
//
//  Created on 2024-02-08.
//

import Foundation
import SwiftUI


class GameManager: ObservableObject {
    // MARK: - Properties
    @Published var matrix: Matrix<Square>
    @Published var livesLeft: Int // attempts left
    @Published var sequencesCompleted: Int // number of sequences correctly performed
    @Published var isGameEnded: Bool
    @Published var sequencePerformed: Bool // true if user correctly performs the sequence
    @Published var numbersFlipped: Bool // flips all NumberViews if true
    
    
    let config: GameConfig
    var numberedPositions: Array<Pair<Int, Int>> // an array of all locations where there is a number
    var nextNumber: Int // the next number to be clicked by the user
    
    
    // MARK: - init
    init(config: GameConfig){
        self.config = config
        self.matrix = Matrix(rows: config.rows, cols: config.cols, defaultValue: Square(number: 1, isVisible: false))
        self.livesLeft = config.lives
        self.sequencesCompleted = 0
        self.isGameEnded = false
        self.sequencePerformed = false
        self.numbersFlipped = false
        self.numberedPositions = []
        self.nextNumber = 1
    }

    
    func generateRandomGrid(qty: Int){
        self.matrix.clear()
        var positions: Set<Pair<Int, Int>> = [];
        
        self.matrix.loop { _, i, j in
            positions.insert(.init(i, j))
        }
        
        guard qty <= positions.capacity else { fatalError("Logical error: number of squares exceed the number of available positions in the matrix.")}
        
        self.numberedPositions = Array(positions.shuffled().prefix(qty))
        self.nextNumber = 1
        var counter = 1
        
        for pos in self.numberedPositions {
            try! self.matrix.update(pos.first, pos.second, value: .init(number: counter, isVisible: true))
            counter += 1
        }
    }
    
    func onNumberTap(pos: Pair<Int, Int>){
        // onInvalidPositionTap
        guard self.numberedPositions.contains(pos) && !self.isGameEnded else { return }
        
        // onCorrectTap
        if pos == self.numberedPositions[self.nextNumber - 1] {
            self.onCorrectNumberTap(pos: pos)
        } else {
            // onWrongTap
            self.onWrongNumberTap(pos: pos)
        }
    }
    
    private func onWrongNumberTap(pos: Pair<Int, Int>){
        self.livesLeft -= 1
        if self.livesLeft == 0 {
            self.isGameEnded = true
        } else {
            self.generateRandomGrid(qty: config.initialSequences + self.sequencesCompleted)
            self.numbersFlipped = false
        }
    }
    
    private func onCorrectNumberTap(pos: Pair<Int, Int>){
        self.numbersFlipped = true // flips all the numbers
        self.nextNumber += 1
        try! self.matrix.update(pos.first, pos.second, value: Square(number: 0, isVisible: false)) // remove the tapped number
        
        if self.nextNumber > self.numberedPositions.capacity { // nextNumber starts from 1 (not 0 indexed), don't get confused
            self.onSequenceCompletion()
        }
    }
    
    private func onSequenceCompletion(){
        self.sequencePerformed.toggle()
        self.sequencesCompleted += 1
        self.generateRandomGrid(qty: config.initialSequences + self.sequencesCompleted)
        self.numbersFlipped = false
    }
    
    func start(){
        self.livesLeft = config.lives
        self.isGameEnded = false
        self.numbersFlipped = false
        self.sequencesCompleted = 0
        self.generateRandomGrid(qty: config.initialSequences)
    }
    
}
