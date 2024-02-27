//
//  LinkedList.swift
//  ChimpTest
//
//  Created on 2024-02-04.
//

import Foundation

/**
 A generic doubly-linked list implementation in Swift.
 */
class LinkedList<T>: ExpressibleByArrayLiteral {
    
    /**
     Node class for the elements of the linked list.
     */
    private class Node {
        var value: T?;
        var left: Node!;
        var right: Node!;
        
        init(value: T? = nil, left: Node! = nil, right: Node! = nil) {
            self.value = value
            self.left = left
            self.right = right
        }
    }
    
    // Leading/trailing sentinels
    private let ls: Node;
    private let rs: Node;
    
    // Size of the linked list
    private(set) var size: Int;
    
    /**
     Initializes an empty linked list.
     */
    init(){
        ls = Node()
        rs = Node()
        size = 0
        
        // Joining the sentinels to create an empty list
        LinkedList.join(ls, rs)
    }
    
    /**
     Initializes a linked list using an array
     */
    required convenience init(arrayLiteral elements: T...) {
        self.init()
        for element in elements {
            push_back(value: element)
        }
    }
    
    
    /**
     Adds a new element to the front of the linked list.
     
     - Parameter value: The value to be added to the front of the list.
     */
    func push_front(value: T){
        let node = Node(value: value)
        LinkedList.join(ls, node, ls.right)
        size += 1
    }
    
    /**
     Adds a new element to the back of the linked list.
     
     - Parameter value: The value to be added to the back of the list.
     */
    func push_back(value: T){
        let node = Node(value: value)
        LinkedList.join(rs.left, node, rs)
        size += 1
    }
    
    /**
     Removes the element from the front of the linked list.
     */
    func popFront() {
        guard !self.isEmpty() else { return }
        LinkedList.join(ls, ls.right.right)
        size -= 1
    }
    
    /**
     Removes the element from the back of the linked list.
     */
    func popBack() {
        guard !self.isEmpty() else { return }
        LinkedList.join(rs.left.left, rs)
        size -= 1
    }
    
    /**
     Checks if the linked list is empty.
     
     - Returns: `true` if the linked list is empty, otherwise `false`.
     */
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func front() -> T? {
        guard !self.isEmpty() else { return nil }
        return self.ls.right.value
    }
    
    func back() -> T? {
        guard !self.isEmpty() else { return nil }
        return self.rs.left.value
    }
    
    /**
     Joins the specified nodes together in a doubly-linked fashion.
     
     - Parameter nodes: Nodes to be joined.
     */
    private static func join(_ nodes: Node...){
        guard nodes.capacity > 1 else { return }
        for i in 0..<nodes.capacity - 1 {
            nodes[i].right = nodes[i + 1];
            nodes[i + 1].left = nodes[i];
        }
    }
    
}
