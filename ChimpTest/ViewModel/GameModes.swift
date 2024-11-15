//
//  GameModes.swift
//  ChimpTest
//
//  Created by Alireza Zahedi on 2024-11-14.
//

import Foundation

protocol GameConfig {
    /* -- WARNING --
     based on testing this works well on portrait mode on iPhones and iPads
     we could make it dynamic in the future
     */
    var rows: Int {get}
    var cols: Int {get}
    var lives: Int {get}
    var initialSequences: Int {get}
}


// MARK: - Providing default values for rows, cols
extension GameConfig {
    var rows: Int {8}
    var cols: Int {5}
}

struct ClassicMode: GameConfig {
    var lives = 3
    var initialSequences = 5
}

struct FlashMode: GameConfig {
    var lives = 5
    var initialSequences = 5
    var visiblityDuration: Double = 3
}

struct TimedMode: GameConfig {
    var lives = 3
    var initialSequences = 5
    var duration: Double = 5 * 60 // 300 seconds -> 5 minutes
}

struct MasterMode: GameConfig {
    var lives = 1
    var initialSequences = 10
}
