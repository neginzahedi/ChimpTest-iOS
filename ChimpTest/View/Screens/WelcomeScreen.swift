//
//  GameIntroView.swift
//  ChimpTest
//
//  Created on 2024-02-18.
//

import SwiftUI


struct PrimaryButton: View {
    let text: String;
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(self.text)
                .bold()
                .font(.system(.title2, design: .monospaced))
                .padding(.vertical, 10)
                .frame(width: 270)
                .foregroundColor(.white)
                .background(.black)
                .cornerRadius(10)
        }
    }
}

struct WelcomeScreen: View {
    @State private var instructionText: String = "";
    @State private var path: Array<String> = []
    
    @State private var config: GameConfig?
    
    let text: String = NSLocalizedString("welcomeScreenMessage", comment: "")
    
    var body: some View {
        NavigationStack(path: $path){
            VStack(){
                topHeader
                
                Spacer()
                
                animatedText
                
                Spacer()
                
                
                PrimaryButton(text: "Classic Mode"){
                    self.config = ClassicMode()
                    path.append("GameScreen")
                }
                
                PrimaryButton(text: "Flash Mode") {
                    self.config = FlashMode()
                    path.append("GameScreen")
                }
                
                PrimaryButton(text: "Master Level"){
                    self.config = MasterMode()
                    path.append("GameScreen")
                }
                Spacer()
            }
            .navigationDestination(for: String.self) { selection in
                // TODO: - Work here
                switch selection {
                    case "GameScreen":
                        if let config {
                            GameScreen(config: config)
                        }
                default:
                    EmptyView()
                }
                
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
