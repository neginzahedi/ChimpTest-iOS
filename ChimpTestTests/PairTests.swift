//
//  PairTests.swift
//  ChimpTestTests
//
//  Created on 2024-02-03.
//

import XCTest

@testable import ChimpTest

final class PairTests: XCTestCase {
    
    func testPairInitializationWithTuple(){
        let pair = Pair(42, "answer")
        XCTAssertEqual(pair.first, 42)
        XCTAssertEqual(pair.second, "answer")
    }
    
    func testPairInitialization(){
        let pair = Pair(4, 2)
        XCTAssertTrue(pair == (4, 2))
    }
   
    func testEqualityWithTuple(){
        let pair = Pair(4, 2)
        let tuple1 = (2, 4)
        let tuple2 = (4, 2)
        
        XCTAssertFalse(pair == tuple1)
        XCTAssertTrue(pair == tuple2)
    }
    
    func testHashValue() {
        let pair1 = Pair(42, "answer")
        let pair2 = Pair(42, "answer")
        let pair3 = Pair(99, "different")

        XCTAssertEqual(pair1.hashValue, pair2.hashValue)
        XCTAssertNotEqual(pair1.hashValue, pair3.hashValue)
    }

    func testSwappingPairs() {
        let pair = Pair(42, "answer")
        let swappedPair = pair.swapped()

        XCTAssertEqual(swappedPair.first, "answer")
        XCTAssertEqual(swappedPair.second, 42)
    }

    func testDescription() {
        let pair = Pair(42, "answer")
        XCTAssertEqual(pair.description, "(42, answer)")
    }

}
