//
//  Matrix.swift
//  ChimpTest
//
//  Created by Alireza Zahedi on 2024-02-01.
//

import Foundation

enum MatrixError: Error {
    case outOfBounds;
}


class Matrix<T: CVarArg> {

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
    
    func display(){
        for row in self.array {
            for element in row {
                print(String(format: "%4d", element), terminator: " ")
            }
            print()
        }
    }
}
