//
//  Square.swift
//  ChimpTest
//
//  Created by Alireza Zahedi on 2024-02-12.
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
