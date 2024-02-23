//
//  GameView.swift
//  ChimpTest
//
//  Created by Negin Zahedi on 2024-02-21.
//

import SwiftUI

struct GameView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var game: Game;
    @State private var isShowingPopover = false
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    self.isShowingPopover = true
                }, label: {
                    Image(systemName: "gear")
                        .font(.title)
                        .foregroundStyle(.black)
                })
                .confirmationDialog("More", isPresented: $isShowingPopover) {
                    Button("Reset") {
                        self.game.restart()
                        self.isShowingPopover = false
                    }
                    Button("Exit") {
                        self.game.isBoardGameHidden = true
                    }
                }
                Spacer()
                Hearts(livesLeft: self.game.lives)
                Spacer()
                Score(score: self.game.score)
            }
            .padding()
            .foregroundColor(.black)
            .background(Color(red: 251/255, green: 216/255, blue: 93/255))
            ChimpGrid()
                .padding()
        }
        .alert("GAME OVER", isPresented: $game.game_ended, actions: {
            VStack{
                Button {
                    self.game.isBoardGameHidden = true
                } label: {
                    Text("Exit")
                }
                
                Button {
                    self.game.restart()
                } label: {
                    Text("Start Over")
                }
            }
        }, message: {
            Text("Your Score: \(game.score)")
        })
        
        .onAppear(){
            self.game.restart()
        }
        .background(colorScheme == .dark ? Color(red: 18/255, green: 18/255, blue: 18/255) : Color(red: 245/255, green: 245/255, blue: 245/255))
    }
}

#Preview {
    GameView()
        .environmentObject(Game())
}
