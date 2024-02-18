//
//  GameIntroView.swift
//  ChimpTest
//
//  Created by Negin Zahedi on 2024-02-18.
//

import SwiftUI

struct GameIntroView: View {
    @EnvironmentObject var game: Game;
    
    var body: some View {
        VStack(spacing: 50){
            Spacer()
            Text("Chimp Test")
                .font(.largeTitle)
            VStack(spacing: 30){
                Text("Welcome to the Memory Challenge, a test of your numerical and visual memory.\n\nYour task is to tap the squares in numerical order. The difficulty will increase as you progress.\n\nDo you have what it takes to outsmart the chimp?")
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                    .padding()
            }
            .frame(maxWidth: .infinity)
            Button {
                self.game.restart()
            } label: {
                Text("Start Test")
                    .bold()
                    .padding(.horizontal, 50)
                    .padding(.vertical, 10)
            }
            .foregroundColor(.white)
            .background(.black)
            .cornerRadius(10)
            .padding(.top, 30)
            
            Spacer()
        }
        .padding()
        .background(Color.yellow.opacity(0.6))
    }
}

#Preview {
    GameIntroView()
}
