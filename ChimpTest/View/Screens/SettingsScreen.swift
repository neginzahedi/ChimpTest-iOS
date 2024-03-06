//
//  SettingsScreen.swift
//  ChimpTest
//
//  Created on 2024-03-06.
//


import SwiftUI

struct SettingsScreen: View {
    
    // MARK: - Properties
    @StateObject var settings = SettingsViewModel.shared
    
    // MARK: - Body
    var body: some View {
        Form {
            Toggle("Dark Mode", isOn: $settings.isDarkMode)
                .tint(.yellow)
        }
        .fontDesign(.monospaced)
        .navigationTitle("Settings")
    }
    
}

// MARK: - Preview
#Preview {
    SettingsScreen()
}

