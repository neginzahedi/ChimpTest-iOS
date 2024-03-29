//
//  GameIntroView.swift
//  ChimpTest
//
//  Created on 2024-02-18.
//

import SwiftUI

struct WelcomeScreen: View {
    @EnvironmentObject var game: GameManager;
    
    @State private var animatedText = ""
    @State private var shouldStopAddingText = false
    
    let text: String = NSLocalizedString("welcomeScreenMessage", comment: "")
    
    var body: some View {
        NavigationStack{
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
                NavigationLink {
                    GameScreen()
                        .environmentObject(game)
                } label: {
                    Text("Start Test")
                        .bold()
                        .font(.system(.title2, design: .monospaced))
                        .padding(.horizontal, 50)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(10)
                }
                .padding(.bottom, 50)
            }
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .environmentObject(game)
            .padding()
            .background(Color(red: 251/255, green: 216/255, blue: 93/255))
            .onAppear(){
                animateText()
            }
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
    WelcomeScreen()
        .environmentObject(GameManager())
}
