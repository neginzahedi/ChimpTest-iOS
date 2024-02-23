//
//  GameIntroView.swift
//  ChimpTest
//
//  Created by Negin Zahedi on 2024-02-18.
//

import SwiftUI

struct GameIntroView: View {
    
    @EnvironmentObject var game: Game;
    let text: String = "Welcome to the Memory Challenge, a test of your numerical and visual memory.\n\nYour task is to tap the squares in numerical order. The difficulty will increase as you progress.\n\nDo you have what it takes to outsmart the chimp?"
    @State private var animatedText = ""
    @State private var shouldStopAddingText = false
    
    var body: some View {
        VStack(){
            Text("Chimp Test")
                .font(.system(.largeTitle, design: .monospaced))
                .padding(.top, 50)
            Spacer()
            
            VStack(alignment: .leading){
                Text(animatedText)
                    .font(.system(.headline, design: .monospaced))
                    .multilineTextAlignment(.leading)
                    .padding()
            }
            .frame(height: 300,alignment: .topLeading)
            Spacer()
            Button {
                shouldStopAddingText.toggle()
                self.game.restart()
            } label: {
                Text("Start Test")
                    .bold()
                    .font(.system(.title2, design: .monospaced))
                    .padding(.horizontal, 50)
                    .padding(.vertical, 10)
            }
            .foregroundColor(.white)
            .background(.black)
            .cornerRadius(10)
            .padding(.bottom, 50)
            
        }
        .frame(maxWidth: .infinity)
        .environmentObject(game)
        .padding()
        .background(Color(red: 251/255, green: 216/255, blue: 93/255))
        .onAppear(){
            animateText()
        }
    }
    func animateText() {
        guard !shouldStopAddingText else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.075) {
            let charIndex = animatedText.count
            if charIndex < text.count {
                animatedText.append(text[text.index(text.startIndex, offsetBy: charIndex)])
                animateText()
            }
        }
    }
}

#Preview {
    GameIntroView()
        .environmentObject(Game())
}
