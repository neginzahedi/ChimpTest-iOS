//
//  HistoryScreen.swift
//  ChimpTest
//
//  Created by Alireza Zahedi on 2024-11-13.
//

import SwiftUI

struct HistoryScreen: View {
    var body: some View {
        VStack {
            ForEach(0..<3, id: \.self){_ in
                HistoryCard()
            }
            Spacer()
        }
    }
}

struct HistoryCard: View {
    var body: some View {
        Rectangle()
            .fill(
                .ultraThickMaterial
            )
            .frame(maxWidth: .infinity, maxHeight: 100)
            .clipShape(.buttonBorder)
            .padding(.horizontal)
    }
}

#Preview {
    HistoryScreen()
}
