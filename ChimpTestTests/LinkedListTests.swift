//
//  LinkedListTests.swift
//  ChimpTestTests
//
//  Created by Alireza Zahedi on 2024-02-04.
//

import XCTest

@testable import ChimpTest

class LinkedListTests: XCTestCase {

    func testEmptyList() {
        let list = LinkedList<Int>()
        
        XCTAssertTrue(list.isEmpty())
        XCTAssertEqual(list.size, 0)
    }

    func testPushFront() {
        let list = LinkedList<Int>()
        list.push_front(value: 42)
        
        XCTAssertEqual(list.front(), 42)
        XCTAssertEqual(list.back(), 42)
        
        XCTAssertFalse(list.isEmpty())
        XCTAssertEqual(list.size, 1)
    }

    func testPushBack() {
        let list = LinkedList<Int>()
        list.push_back(value: 42)
        
        XCTAssertEqual(list.back(), 42)
        XCTAssertFalse(list.isEmpty())
        XCTAssertEqual(list.size, 1)
    }

    func testPopFront() {
        let list = LinkedList<Int>()
        list.push_front(value: 42)
        list.popFront()
        
        XCTAssertEqual(list.front(), nil)
        XCTAssertTrue(list.isEmpty())
        XCTAssertEqual(list.size, 0)
    }

    func testPopBack() {
        let list = LinkedList<Int>()
        list.push_back(value: 42)
        list.popBack()
        
        XCTAssertEqual(list.back(), nil)
        XCTAssertTrue(list.isEmpty())
        XCTAssertEqual(list.size, 0)
    }

    func testPushMultiple() {
        let list = LinkedList<Int>()
        list.push_front(value: 42)
        list.push_back(value: 24)
        
        
        XCTAssertEqual(list.front(), 42)
        XCTAssertEqual(list.back(), 24)
        XCTAssertFalse(list.isEmpty())
        XCTAssertEqual(list.size, 2)
    }

    func testPopMultiple() {
        let list = LinkedList<Int>()
        list.push_front(value: 42)
        list.push_back(value: 24)
        list.popFront()
        list.popBack()
        
        XCTAssertTrue(list.isEmpty())
        XCTAssertEqual(list.size, 0)
    }
    
    func testInitializationWithArray(){
        let list: LinkedList<Int> = [1, 2, 3, 4, 5]
        
        XCTAssertEqual(list.size, 5)
        XCTAssertEqual(list.front(), 1)
        XCTAssertEqual(list.back(), 5)
    }

}
