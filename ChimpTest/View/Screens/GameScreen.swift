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
    
    @StateObject var game: GameManager
    @State private var isShowingPopover: Bool = false;
    
    init(config: GameConfig) {
        _game = StateObject(wrappedValue: GameManager(config: config))
    }
    
    var body: some View {
        VStack(spacing: 0){
            HStack{
                settingsButton
                
                Spacer()
                
                Hearts(livesLeft: self.game.livesLeft, maxLives: self.game.config.lives)
                
                Spacer()
                
                score
            }
            .padding()
            .foregroundColor(.black)
            .background(Color(red: 251/255, green: 216/255, blue: 93/255))

            ChimpGrid()
                .environmentObject(game)
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
        .onAppear(){
            self.game.start()
        }
        .background(colorScheme == .dark ? Color(red: 18/255, green: 18/255, blue: 18/255) : Color(red: 245/255, green: 245/255, blue: 245/255))
    }
    
    // MARK: - Subviews
    private var score: some View {
        VStack(alignment: .center,spacing: 15){
            Text("Score")
                .bold()
            Text("\(self.game.sequencesCompleted)")
        }
        .font(.system(.headline, design: .monospaced))
    }
    
    private var settingsButton: some View {
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
    }
}
#Preview {
    GameScreen(config: ClassicMode())
}
