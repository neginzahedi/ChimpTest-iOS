//
//  ChimpGrid.swift
//  ChimpTest
//
//  Created by Alireza Zahedi on 2024-02-05.
//

import SwiftUI


struct ChimpGrid: View {
    let rows: Int;
    let cols: Int;

    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let height = geo.size.height
            let gap = 10.0
            
            let x_space = width - (Double((self.cols + 1)) * gap)
            let x_max_square_size = x_space / Double(self.cols)
            
            let y_space = height - (Double((self.rows + 1)) * gap)
            let y_max_square_size = y_space / Double(self.rows)
            
            let cell_size = min(y_max_square_size, x_max_square_size)
            
            
            VStack(spacing: gap){
                ForEach(0..<rows, id: \.self) { _ in
                    HStack(spacing: gap) {
                        ForEach(0..<cols, id: \.self) { _ in
                            RoundedRectangle(cornerRadius: 5).foregroundColor(.black)
                                .frame(width: cell_size, height: cell_size)
                        }
                    }
                    
                }
            }.position(x: width / 2, y: height / 2)
        }
    }
}

#Preview {
    ChimpGrid(rows: 9, cols: 5)
}
