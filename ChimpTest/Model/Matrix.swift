/// A generic matrix data structure.
///
/// This class represents a matrix with elements of type `T`. It provides basic operations
/// such as element updates, resizing, clearing, accessing elements, obtaining dimensions,
/// and performing operations on each element in the matrix.
///
/// Example Usage:
/// ```swift
/// var matrix = Matrix(rows: 3, cols: 3, defaultValue: 0)
/// try? matrix.update(1, 1, value: 42)
/// print(matrix.at(1, 1)) // Output: 42
/// matrix.loop { element, row, col in
///     print("Element at (\(row), \(col)): \(element)")
/// }
/// ```
///
/// - Important: The matrix uses a zero-based indexing system.
///
/// - Note: The matrix is initialized with a default value for all elements.

import SwiftUI

class Matrix<T>: ObservableObject {
    /// An enumeration representing possible errors that can occur during matrix operations.
    ///
    /// - `outOfBounds`: The specified indices are outside the valid range of the matrix.
    enum MatrixError: Error {
        case outOfBounds
    }
    
    /// The 2D array holding the elements of the matrix.
    private var array: Array<Array<T>>
    
    /// The number of rows in the matrix.
    private(set) var rows: Int
    
    /// The number of columns in the matrix.
    private(set) var cols: Int
    
    /// The default value used for initializing and resetting elements in the matrix.
    var defaultValue: T
    
    /// Creates a new matrix with the specified number of rows, columns, and default value.
    ///
    /// - Parameters:
    ///   - rows: The number of rows in the matrix.
    ///   - cols: The number of columns in the matrix.
    ///   - defaultValue: The default value used for initializing elements in the matrix.
    init(rows: Int, cols: Int, defaultValue: T) {
        self.array = Array(repeating: Array(repeating: defaultValue, count: cols), count: rows)
        self.defaultValue = defaultValue
        self.rows = rows
        self.cols = cols
    }
    
    /// Updates the element at the specified indices with the given value.
    ///
    /// - Parameters:
    ///   - i: The row index.
    ///   - j: The column index.
    ///   - value: The new value to set at the specified indices.
    /// - Throws: `MatrixError.outOfBounds` if the indices are outside the valid range of the matrix.
    func update(_ i: Int, _ j: Int, value: T) throws {
        try check_dimensions(i, j)
        self.objectWillChange.send()
        array[i][j] = value
    }
    
    /// Checks whether the specified indices are within the valid range of the matrix.
    ///
    /// - Parameters:
    ///   - i: The row index.
    ///   - j: The column index.
    /// - Throws: `MatrixError.outOfBounds` if the indices are outside the valid range of the matrix.
    private func check_dimensions(_ i: Int, _ j: Int) throws {
        guard i >= 0 && j >= 0 && i < rows && j < cols else {
            throw MatrixError.outOfBounds
        }
    }
    
    /// Resizes the matrix to the specified number of rows and columns.
    ///
    /// - Parameters:
    ///   - rows: The new number of rows in the matrix.
    ///   - cols: The new number of columns in the matrix.
    func resize(rows: Int, cols: Int) {
        self.objectWillChange.send()
        array = Array(repeating: Array(repeating: defaultValue, count: cols), count: rows)
        self.rows = rows
        self.cols = cols
    }
    
    /// Clears all elements in the matrix, setting them to the default value.
    func clear() {
        self.objectWillChange.send()
        array = Array(repeating: Array(repeating: defaultValue, count: cols), count: rows)
    }
    
    /// Retrieves the element at the specified indices in the matrix.
    ///
    /// - Parameters:
    ///   - i: The row index.
    ///   - j: The column index.
    /// - Returns: The element at the specified indices.
    func at(_ i: Int, _ j: Int) -> T {
        array[i][j]
    }
    
    /// Returns the dimensions of the matrix as a pair of integers.
    ///
    /// - Returns: A `Pair` representing the number of rows and columns in the matrix.
    func dimensions() -> Pair<Int, Int> {
        .init(rows, cols)
    }
    
    /// Applies a closure to each element in the matrix.
    ///
    /// The closure receives the element value along with its row and column indices.
    ///
    /// - Parameter fn: The closure to apply to each element in the matrix.
    func loop(_ fn: (T, Int, Int) -> Void) {
        for i in 0..<rows {
            for j in 0..<cols {
                fn(at(i, j), i, j)
            }
        }
    }
}
