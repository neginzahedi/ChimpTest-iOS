//
//  Square.swift
//  ChimpTest
//
//  Created on 2024-02-12.
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
