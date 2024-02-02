//
//  Pair.swift
//  ChimpTest
//
//  Created by Alireza Zahedi on 2024-02-02.
//

import Foundation


struct Pair<T: Hashable, M: Hashable>: Hashable {
    var first: T;
    var second: M;
    
    static func == (lhs: Pair<T, M>, rhs: (T, M)) -> Bool {
        return lhs.first == rhs.0 && lhs.second == rhs.1
    }
    
    init(_ first: T, _ second: M) {
        self.first = first
        self.second = second
    }
    
    init(_ tuple: (T, M)){
        self.first = tuple.0
        self.second = tuple.1
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(first)
        hasher.combine(second)
    }

}
