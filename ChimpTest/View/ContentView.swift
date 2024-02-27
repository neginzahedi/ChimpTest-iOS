//
//  ContentView.swift
//  ChimpTest
//
//  Created by Negin Zahedi on 2024-01-30.
//

import SwiftUI

struct ContentView: View {
    @StateObject var game: GameManager = GameManager() // initializing the GameManager class
    
    var body: some View {
        VStack{
            if game.isGameViewHidden{
                WelcomeScreen()
            } else {
                GameScreen()
            }
        }.environmentObject(game)
    }
}

#Preview {
    ContentView()
}
