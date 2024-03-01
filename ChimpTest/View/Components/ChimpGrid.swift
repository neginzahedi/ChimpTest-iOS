//
//  ChimpGrid.swift
//  ChimpTest
//
//  Created on 2024-02-05.
//

import SwiftUI


struct ChimpGrid: View {
    @EnvironmentObject var game: GameManager;
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let height = geo.size.height
            let gap = 10.0 // gap between and around cells
            
            let x_space = width - (Double((GameConfig.cols + 1)) * gap)
            let x_max_square_size = x_space / Double(GameConfig.cols)
            
            let y_space = height - (Double((GameConfig.rows + 1)) * gap)
            let y_max_square_size = y_space / Double(GameConfig.rows)
            
            let cell_size = min(y_max_square_size, x_max_square_size)
            
            
            VStack(spacing: gap){
                ForEach(0..<game.matrix.rows, id: \.self) { i in
                    HStack(spacing: gap) {
                        ForEach(0..<game.matrix.cols, id: \.self) { j in
                            let square = game.matrix.at(i, j)
                            NumberView(number: square.number, isVisible: square.isVisible, isFlipped: self.game.numbersFlipped, size: cell_size){
                                self.game.onNumberTap(pos: .init(i, j))
                            }
                        }
                    }
                }
            }.position(x: width / 2, y: height / 2)
        }
    }
}


#Preview {
    ChimpGrid()
        .environmentObject(GameManager())
}

