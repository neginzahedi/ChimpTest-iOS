//
//  Score.swift
//  ChimpTest
//
//  Created by Negin Zahedi on 2024-02-09.
//

import SwiftUI

struct Score: View {
    var score: Int
    
    var body: some View {
        VStack(alignment: .center,spacing: 15){
            Text("Score")
                .bold()
            Text("\(score)")
        }
        .font(.system(.headline, design: .monospaced))
    }
}

#Preview {
    Score(score: 5)
}
