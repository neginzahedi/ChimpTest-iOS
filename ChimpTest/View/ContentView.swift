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
        VStack{
            HStack{
                Hearts(livesLeft: 3)
                Spacer()
                Score(score: 5)
            }
            .padding(30)
            ChimpGrid()
                .environmentObject(game)
        }
    }
}

#Preview {
    ContentView()
}
