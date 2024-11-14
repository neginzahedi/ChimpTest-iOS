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
            
            let x_space = width - (Double((game.config.cols + 1)) * gap)
            let x_max_square_size = x_space / Double(game.config.cols)
            
            let y_space = height - (Double((game.config.rows + 1)) * gap)
            let y_max_square_size = y_space / Double(game.config.rows)
            
            let cell_size = min(y_max_square_size, x_max_square_size)

            
            CGridView(rows: game.matrix.rows, cols: game.matrix.cols, spacing: gap) { i, j in
                let square = game.matrix.at(i, j)
                /**
                 Why do we need to check for positive cell_size?
                 for a brief moment GeometryReader assigns the height and width of 0 untill the parent is completely drawn on the screen. As a result, the value of the cell_size becomes negative and xcode gives us the purple warning at run time.
                 */
                if cell_size > 0 {
                    NumberView(number: square.number, isVisible: square.isVisible, isFlipped: self.game.numbersFlipped, size: cell_size){
                        self.game.onNumberTap(pos: .init(i, j))
                    }
                }
            }.position(x: width / 2, y: height / 2)
        }
    }
}


#Preview {
    ChimpGrid()
        .environmentObject(GameManager(config: ClassicMode()))
}

