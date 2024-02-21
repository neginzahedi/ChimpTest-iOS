//
//  GameView.swift
//  ChimpTest
//
//  Created by Negin Zahedi on 2024-02-21.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var game: Game;
    
    var body: some View {
        VStack{
            HStack{
                Hearts(livesLeft: self.game.lives)
                Spacer()
                Score(score: self.game.score)
            }
            .padding(30)
            ChimpGrid()
        }
    }
}

#Preview {
    GameView()
        .environmentObject(Game())
}
