//
//  ChimpTestApp.swift
//  ChimpTest
//
//  Created on 2024-01-30.
//

import SwiftUI

@main
struct ChimpTestApp: App {
    @StateObject var settings = SettingsViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            WelcomeScreen()
                .preferredColorScheme(settings.isDarkMode ? .dark : .light)
        }
    }
}
