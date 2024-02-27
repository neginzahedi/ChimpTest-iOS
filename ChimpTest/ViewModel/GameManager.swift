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
    @Published var matrix: Matrix<Square>;
    
    @Published var lives: Int; // attempts left
    @Published var sequencesCompleted: Int; // number of sequences correctly performed
    @Published var isGameEnded: Bool;
    @Published var sequencePerformed: Bool = false // true if user correctly performs the sequence
    @Published var numbersFlipped: Bool = false // flips all NumberViews if true
    
    // TODO: - Remove this when navigation is implemented
    @Published var isGameViewHidden: Bool = true

    
    /* -- WARNING --
     based on testing this works well on portrait mode on iPhones and iPads
     we could make it dynamic in the future
     */
    let rows: Int = 8;
    let cols: Int = 5;
    
    var numberedPositions: Array<Pair<Int, Int>> // an array of all locations where there is a number
    var nextNumber: Int; // the next number to be clicked by the user
    
    init(){
        self.matrix = Matrix(rows: self.rows, cols: self.cols, defaultValue: Square(number: 1, isVisible: false))
        self.sequencesCompleted = 0
        self.lives = 3
        self.isGameEnded = true
        
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
        self.objectWillChange.send() // matrix class needs this, in order to trigger the view re-rendering
    }
    
    func onNumberTap(pos: Pair<Int, Int>){
        guard self.numberedPositions.contains(pos) && !self.isGameEnded else { return }
        
        if pos == self.numberedPositions[self.nextNumber - 1] {            
            self.numbersFlipped = true
            self.nextNumber += 1
            
            try! self.matrix.update(pos.first, pos.second, value: Square(number: 0, isVisible: false))
            if self.nextNumber > self.numberedPositions.capacity {
                self.sequencePerformed.toggle()
                self.sequencesCompleted += 1
                self.generateRandomGrid(qty: 5 + self.sequencesCompleted)
                self.numbersFlipped = false
            }
            self.objectWillChange.send()
            
        } else {
            self.lives -= 1
            if self.lives == 0 {
                self.isGameEnded = true
            } else {
                self.generateRandomGrid(qty: 5 + self.sequencesCompleted)
                self.numbersFlipped = false
            }
        }
    }
    
    func restart(){
        self.lives = 3
        self.isGameEnded = false
        self.numbersFlipped = false
        self.sequencesCompleted = 0
        self.generateRandomGrid(qty: 5 + self.sequencesCompleted)
    }
}
