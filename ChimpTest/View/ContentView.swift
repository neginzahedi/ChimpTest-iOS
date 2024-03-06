//
//  ContentView.swift
//  ChimpTest
//
//  Created on 2024-01-30.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var game: GameManager = GameManager() // initializing the GameManager class
    @StateObject var settings = SettingsViewModel.shared
    
    var body: some View {
        WelcomeScreen()
            .environmentObject(game)
            .preferredColorScheme(settings.isDarkMode ? .dark : .light)
    }
}

#Preview {
    ContentView()
}
