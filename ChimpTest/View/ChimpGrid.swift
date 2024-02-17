//
//  ChimpGrid.swift
//  ChimpTest
//
//  Created by Alireza Zahedi on 2024-02-05.
//

import SwiftUI


struct ChimpGrid: View {
    @EnvironmentObject var game: Game;
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let height = geo.size.height
            let gap = 10.0
            
            let x_space = width - (Double((game.cols + 1)) * gap)
            let x_max_square_size = x_space / Double(game.cols)
            
            let y_space = height - (Double((game.rows + 1)) * gap)
            let y_max_square_size = y_space / Double(game.rows)
            
            let cell_size = min(y_max_square_size, x_max_square_size)
            
            
            VStack(spacing: gap){
                ForEach(0..<game.matrix.rows, id: \.self) { i in
                    HStack(spacing: gap) {
                        ForEach(0..<game.matrix.cols, id: \.self) { j in
                            let square = game.matrix.at(i, j)
                            NumberSquareView(number: square.number, isVisible: square.isVisible)
                                .frame(width: cell_size, height: cell_size)
                                .onTapGesture {
                                    self.game.onSquareTap(pos: .init(i, j))
                                }
                        }
                    }
                    
                }
                
                Button("start") {
                    self.game.restart()
                }
            }.position(x: width / 2, y: height / 2)
        }
    }
}

#Preview {
    ChimpGrid()
        .environmentObject(Game())
}

struct NumberSquareView: View {
    
    @EnvironmentObject var game: Game;
    
    let number: Int
    let isVisible: Bool
    
    var opacityvalue: Double {
        if isVisible {
            return 1.0
        } else{
            return 0.0
        }
    }
    
    
    var body: some View {
        Image(game.imagesFlipped ? "chimp" : "\(number)")
            .resizable()
            .opacity(opacityvalue)
    }
}
