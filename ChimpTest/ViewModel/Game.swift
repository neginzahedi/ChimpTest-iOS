//
//  Game.swift
//  ChimpTest
//
//  Created by Alireza Zahedi on 2024-02-08.
//

import Foundation


class Square: ObservableObject {
    @Published var number: Int;
    @Published var isVisible: Bool;
    
    init(number: Int, isVisible: Bool=false) {
        self.isVisible = isVisible
        self.number = number
    }
}


class Game: ObservableObject {
    // MARK: - Properties
    @Published var matrix: Matrix<Square>;
    @Published var score: Int;
    @Published var lives: Int;
    
    let rows: Int = 8;
    let cols: Int = 5;

    
    var positions_with_numbers: Array<Pair<Int, Int>>
    var next_number: Int;
    
    init(){
        self.matrix = Matrix(rows: self.rows, cols: self.cols, defaultValue: Square(number: 1, isVisible: false))
        self.score = 0
        self.positions_with_numbers = []
        self.next_number = 1
        self.lives = 3
    }
    
    
    func next_round(qty: Int){
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
    
    func reset(){
        self.matrix.clear()
        self.score = 0
        self.next_number = 1;
        self.lives = 3
    }

}

