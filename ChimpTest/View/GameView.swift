//
//  GameView.swift
//  ChimpTest
//
//  Created by Negin Zahedi on 2024-02-21.
//

import SwiftUI

struct GameView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
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
                    Button(isDarkMode ? "Change to Light Mode" : "Change to Dark Mode") {
                        isDarkMode.toggle()
                    }
                    Button("Reset") {
                        self.game.restart()
                    }
                    Button("Exit") {
                        self.game.isGameViewHidden = true
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
        
        // MARK: Alerts
        .alert("GAME OVER", isPresented: $game.game_ended, actions: {
            Button {
                self.game.isGameViewHidden = true
            } label: {
                Text("Exit")
            }
            Button {
                self.game.restart()
            } label: {
                Text("Start Over")
            }
        }, message: { Text("Your Score: \(game.score)") })
        
        .alert("LEVEL PASSED", isPresented: $game.isLevelPassed, actions: {
            Button("Next") {}
        }, message: {
            Text("Your Score: \(game.score)")
        })
        
        .onAppear(){
            self.game.restart()
        }
        .background(colorScheme == .dark ? Color(red: 18/255, green: 18/255, blue: 18/255) : Color(red: 245/255, green: 245/255, blue: 245/255))
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    GameView()
        .environmentObject(Game())
}
