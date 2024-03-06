//
//  SettingsViewModel.swift
//  ChimpTest
//
//  Created by Negin Zahedi on 2024-03-06.
//

import Foundation
import SwiftUI

class SettingsViewModel: ObservableObject {
    
    // MARK: - Properties
    @AppStorage("isDarkMode") var isDarkMode: Bool = UserDefaults.standard.bool(forKey: "isDarkMode")
    
    // MARK: - Singleton
    static let shared = SettingsViewModel()
    
}
