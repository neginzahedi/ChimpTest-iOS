//
//  Hearts.swift
//  ChimpTest
//
//  Created by Negin Zahedi on 2024-02-01.
//

import SwiftUI

struct Hearts: View {
    
    var heartsNumber: Int
    
    var body: some View {
        VStack(alignment: .center,spacing: 15){
            Text("Lives")
                .bold()
            HStack{
                ForEach(0..<3) { index in
                    Image(systemName: index < self.heartsNumber ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                }
            }
        }
    }
}

#Preview {
    Hearts(heartsNumber: 3)
}
