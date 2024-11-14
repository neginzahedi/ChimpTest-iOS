//
//  GameIntroView.swift
//  ChimpTest
//
//  Created on 2024-02-18.
//

import SwiftUI

struct WelcomeScreen: View {
    @State private var instructionText: String = "";

    let text: String = NSLocalizedString("welcomeScreenMessage", comment: "")
    
    var body: some View {
        NavigationStack{
            VStack(){
                topHeader
                
                Spacer()
                
                animatedText
                
                Spacer()
                
                startButton
            }
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.bgYellow)
            .onAppear(){
                animateText()
            }
        }
    }
    
    // MARK: - Subviews
    private var topHeader: some View {
        Text("Chimp Test")
            .font(.system(.largeTitle, design: .monospaced))
            .padding(.top, 50)
    }
    
    private var animatedText: some View {
        VStack(alignment: .leading){
            Text(instructionText)
                .font(.system(.headline, design: .monospaced))
                .multilineTextAlignment(.leading)
                .padding()
        }
        .frame(height: 300,alignment: .topLeading)
    }
    
    
    // TODO: - Complete this
    private var regularTestButton: some View {
        NavigationLink(value: "HomeScreen"){
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
    
    private var startButton: some View {
        NavigationLink {
            GameScreen()
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
    
    
    // MARK: - View's Methods
    func animateText() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.075) {
            let charIndex = instructionText.count
            if charIndex < text.count {
                instructionText.append(text[text.index(text.startIndex, offsetBy: charIndex)])
                animateText()
            }
        }
    }
}

#Preview {
    WelcomeScreen()
}
