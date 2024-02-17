//
//  Hearts.swift
//  ChimpTest
//
//  Created by Negin Zahedi on 2024-02-01.
//

import SwiftUI

struct Hearts: View {
    
    var livesLeft: Int
    let maxLives: Int = 3
    
    var body: some View {
        VStack(alignment: .center,spacing: 15){
            Text("Lives")
                .bold()
            HStack{
                ForEach(0..<maxLives, id: \.self) { index in
                    Image(systemName: index < self.livesLeft ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                }
            }
        }
    }
}

#if DEBUG
import SwiftUI

#Preview {
    Hearts(livesLeft: 2)
}
#endif
