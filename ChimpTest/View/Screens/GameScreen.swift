//
//  GameView.swift
//  ChimpTest
//
//  Created on 2024-02-21.
//

import SwiftUI

struct GameScreen: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var game: GameManager;
    
    @State private var isShowingPopover: Bool = false;
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    isShowingPopover = true
                }, label: {
                    Image(systemName: "gear")
                        .font(.title)
                        .foregroundStyle(.black)
                })
                .confirmationDialog("More", isPresented: $isShowingPopover) {
                    NavigationLink {
                        SettingsScreen()
                    } label: {
                        Text("Settings")
                    }
                    
                    Button("Reset") {
                        self.game.start()
                    }
                    Button("Exit") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                Spacer()
                Hearts(livesLeft: self.game.lives)
                Spacer()
                Score(score: self.game.sequencesCompleted)
            }
            .padding()
            .foregroundColor(.black)
            .background(Color(red: 251/255, green: 216/255, blue: 93/255))
            ChimpGrid()
                .padding()
        }
        .navigationBarBackButtonHidden()
        // MARK: Alerts
        .alert("GAME OVER", isPresented: $game.isGameEnded, actions: {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Exit")
            }
            Button {
                self.game.start()
            } label: {
                Text("Start Over")
            }
        }, message: { Text("Your Score: \(game.sequencesCompleted)") })
        
        //        .alert("LEVEL PASSED", isPresented: $game.sequencePerformed, actions: {
        //            Button("Next") {}
        //        }, message: {
        //            Text("Your Score: \(game.sequencesCompleted)")
        //        })
        
        .onAppear(){
            self.game.start()
        }
        .background(colorScheme == .dark ? Color(red: 18/255, green: 18/255, blue: 18/255) : Color(red: 245/255, green: 245/255, blue: 245/255))
    }
}

#Preview {
    GameScreen()
        .environmentObject(GameManager())
}
