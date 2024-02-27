//
//  MatrixTests.swift
//  ChimpTestTests
//
//  Created on 2024-02-01.
//


import XCTest

@testable import ChimpTest


class MatrixTests: XCTestCase {
    func testMatrixInitialization() {
        let matrix = Matrix(rows: 3, cols: 5, defaultValue: 0)
        
        XCTAssertNoThrow(matrix.at(2, 4))
        XCTAssertEqual(matrix.rows, 3)
        XCTAssertEqual(matrix.cols, 5)
    }
    
    func testMatrixUpdate() {
        let matrix = Matrix(rows: 3, cols: 4, defaultValue: 0)
        
        XCTAssertNoThrow(try matrix.update(1, 1, value: 42))
        XCTAssertEqual(matrix.at(1, 1), 42)
    }
    
    func testMatrixOutOfBoundsUpdate() {
        let matrix = Matrix(rows: 3, cols: 3, defaultValue: 0)
        
        XCTAssertThrowsError(try matrix.update(3, 3, value: 42)) { error in
            XCTAssertEqual(error as? Matrix<Int>.MatrixError, Matrix<Int>.MatrixError.outOfBounds)
        }
    }
    
    func testMatrixResize() {
        let matrix = Matrix(rows: 3, cols: 3, defaultValue: 0)
        matrix.resize(rows: 2, cols: 2)
        
        XCTAssertEqual(matrix.rows, 2)
        XCTAssertEqual(matrix.cols, 2)
    }
    
    func testMatrixClear() {
        let matrix = Matrix(rows: 3, cols: 3, defaultValue: 0)
        
        try! matrix.update(0, 1, value: 42)
        try! matrix.update(1, 0, value: 42)
        
        matrix.clear()
        
        for i in 0..<matrix.rows {
            for j in 0..<matrix.cols {
                XCTAssertEqual(matrix.at(i, j), 0)
            }
        }
    }
    
    func testMatrixDimensions(){
        let matrix = Matrix<Int?>(rows: 3, cols: 5, defaultValue: nil)
        
        XCTAssertTrue(matrix.dimensions() == (3, 5))
    }
    
}
