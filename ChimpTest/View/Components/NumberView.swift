//
//  NumberView.swift
//  ChimpTest
//
//  Created on 2024-02-26.
//

import SwiftUI

struct NumberView: View {
    let number: Int
    let isVisible: Bool
    let isFlipped: Bool
    let size: CGFloat
    
    let action: () -> ()
    
    private var opacityValue: Double {
        isVisible ? 1.0 : 0.0
    }
    
    var body: some View {
        Image(self.isFlipped ? "chimp" : "\(number)")
            .resizable()
            .frame(width: size, height: size)
            .opacity(opacityValue)
            .onTapGesture {
                action()
            }
    }
}

#Preview {
    ZStack {
        Color.bgYellow
            .ignoresSafeArea()
        HStack {
            NumberView(number: 10, isVisible: true , isFlipped: false, size: 150){}
            NumberView(number: 10, isVisible: true , isFlipped: true, size: 150){}
        }
    }
}
