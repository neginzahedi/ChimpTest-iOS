//
//  ContentView.swift
//  ChimpTest
//
//  Created by Negin Zahedi on 2024-01-30.
//

import SwiftUI

struct ContentView: View {
    @StateObject var game: Game = Game()
    
    var body: some View {
        ChimpGrid()
            .environmentObject(game)
    }
}

#Preview {
    ContentView()
}
