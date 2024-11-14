//
//  Pair.swift
//  ChimpTest
//
//  Created on 2024-02-02.
//
/// A generic structure representing a pair of two values.
///
/// This `Pair` struct is designed to hold two values of potentially different types, `T` and `M`.
/// It conforms to the `Hashable` protocol, allowing instances to be used in hash-based collections.
/// The equality comparison is based on the equality of both `first` and `second` values.
///
/// Example Usage:
/// ```swift
/// let myPair = Pair("Hello", 42)
/// print(myPair) // Output: (Hello, 42)
/// ```
///
/// - Note: Both `T` and `M` must conform to the `Hashable` protocol for the struct to be hashable.
struct Pair<T: Hashable, M: Hashable>: Hashable {
    /// The first value of the pair.
    var first: T

    /// The second value of the pair.
    var second: M

    /// A textual representation of the pair, suitable for debugging.
    var description: String {
        return "(\(first), \(second))"
    }

    /// Creates a new pair with the given values.
    ///
    /// - Parameters:
    ///   - first: The first value of the pair.
    ///   - second: The second value of the pair.
    init(_ first: T, _ second: M) {
        self.first = first
        self.second = second
    }

    /// Creates a new pair from a tuple with matching types.
    ///
    /// - Parameter tuple: A tuple containing the first and second values of the pair.
    init(_ tuple: (T, M)) {
        self.first = tuple.0
        self.second = tuple.1
    }

    /// Hashes the values of the pair into the given hasher.
    ///
    /// This method is required to conform to the `Hashable` protocol.
    ///
    /// - Parameter hasher: The hasher to use for the hashing process.
    func hash(into hasher: inout Hasher) {
        hasher.combine(first)
        hasher.combine(second)
    }
    
    /// Swaps the first with the second value of the pair and returns the result
    func swapped() -> Pair<M, T> {
        Pair<M, T>(self.second, self.first)
    }

    /// Checks whether the current pair is equal to another pair.
    ///
    /// - Parameters:
    ///   - lhs: The left-hand side pair.
    ///   - rhs: The right-hand side pair represented as a tuple.
    /// - Returns: `true` if both pairs are equal, `false` otherwise.
    static func == (lhs: Pair<T, M>, rhs: (T, M)) -> Bool {
        return lhs.first == rhs.0 && lhs.second == rhs.1
    }
}
