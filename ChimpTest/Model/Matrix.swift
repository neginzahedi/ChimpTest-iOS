//
//  Matrix.swift
//  ChimpTest
//
//  Created by Alireza Zahedi on 2024-02-01.
//

import Foundation

// MARK: - Error Enum
enum MatrixError: Error {
    case outOfBounds;
}


class Matrix<T> {
    // MARK: - Properties
    private var array: Array<Array<T>>;
    private(set) var rows: Int;
    private(set) var cols: Int;
    
    var defaultValue: T;
    
    // MARK: - Constructor
    init(rows: Int, cols: Int, defaultValue: T) {
        self.array = Array(repeating: Array(repeating: defaultValue, count: rows), count: cols)
        
        self.defaultValue = defaultValue
        self.rows = rows;
        self.cols = cols;
    }
    
    
    // MARK: - Methods
    func update(_ i: Int, _ j: Int, value: T) throws {
        try self.check_dimensions(i, j)
        self.array[i][j] = value
    }
    
    func check_dimensions(_ i: Int, _ j: Int) throws {
        guard i >= 0 && j >= 0 && i < self.rows && j < self.cols else {
            throw MatrixError.outOfBounds
        }
    }
    
    func resize(rows: Int, cols: Int){
        self.array = Array(repeating: Array(repeating: defaultValue, count: rows), count: cols)
        self.rows = rows;
        self.cols = cols;
    }
    
    func clear(){
        self.array = Array(repeating: Array(repeating: defaultValue, count: rows), count: cols)
    }
    
    func at(_ i: Int, _ j: Int) -> T{
        self.array[i][j]
    }
    
    func dimensions() -> Pair<Int, Int> {
        .init(self.rows, self.cols)
    }
    
    func loop(_ fn: (T, Int, Int) -> Void) {
        for i in 0..<self.rows {
            for j in 0..<self.cols {
                fn(self.at(i, j), i, j)
            }
        }
    }
}
