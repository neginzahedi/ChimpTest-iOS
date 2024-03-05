//
//  ContentView.swift
//  ChimpTest
//
//  Created on 2024-01-30.
//

import SwiftUI

struct ContentView: View {
    @StateObject var game: GameManager = GameManager() // initializing the GameManager class
    
    var body: some View {
        WelcomeScreen()
            .environmentObject(game)
    }
}

#Preview {
    ContentView()
}
