//
//  Game.swift
//  ChimpTest
//
//  Created by Alireza Zahedi on 2024-02-08.
//

import Foundation
import SwiftUI



class Game: ObservableObject {
    // MARK: - Properties
    @Published var matrix: Matrix<Square>;
    @Published var score: Int;
    @Published var lives: Int;
    @Published var game_ended: Bool;
    let rows: Int = 8;
    let cols: Int = 5;
    @Published var imagesFlipped: Bool = false
    @Published var isBoardGameHidden: Bool = true
    
    var positions_with_numbers: Array<Pair<Int, Int>>
    var next_number: Int;
    
    init(){
        self.matrix = Matrix(rows: self.rows, cols: self.cols, defaultValue: Square(number: 1, isVisible: false))
        self.score = 0
        self.lives = 3
        self.game_ended = true
        
        self.positions_with_numbers = []
        self.next_number = 1
    }
    
    
    func generate_random_grid(qty: Int){
        self.matrix.clear()
        var positions: Set<Pair<Int, Int>> = [];
        
        self.matrix.loop { _, i, j in
            positions.insert(.init(i, j))
        }
        
        guard qty <= positions.capacity else { fatalError("Logical error: number of squares exceed the number of available positions in the matrix.")}
        
        
        self.positions_with_numbers = Array(positions.shuffled().prefix(qty))
        self.next_number = 1
        var counter = 1
        
        for pos in self.positions_with_numbers {
            try! self.matrix.update(pos.first, pos.second, value: .init(number: counter, isVisible: true))
            counter += 1
        }
        self.objectWillChange.send() // matrix class needs this
    }
    
    func onSquareTap(pos: Pair<Int, Int>){
        guard self.positions_with_numbers.contains(pos) && !self.game_ended else { return }
        
        if pos == self.positions_with_numbers[self.next_number - 1] {
            print("Correct")
            
            // test
            self.imagesFlipped = true
            
            
            self.next_number += 1
            try! self.matrix.update(pos.first, pos.second, value: Square(number: 0, isVisible: false))
            if self.next_number > self.positions_with_numbers.capacity {
                self.score += 1
                self.generate_random_grid(qty: 5 + self.score)
                self.imagesFlipped = false
            }
            self.objectWillChange.send()
            
        } else {
            self.lives -= 1
            if self.lives == 0 {
                self.game_ended = true
            } else {
                self.generate_random_grid(qty: 5 + self.score)
                self.imagesFlipped = false
            }
        }
    }
    
    func restart(){
        self.lives = 3
        self.score = 0
        self.game_ended = false
        self.isBoardGameHidden = false
        self.generate_random_grid(qty: 5 + self.score)
        self.imagesFlipped = false
    }
}

