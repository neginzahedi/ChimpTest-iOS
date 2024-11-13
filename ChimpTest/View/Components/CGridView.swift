//
//  CGridView.swift
//  ChimpTest
//
//  Created by Alireza Zahedi on 2024-11-13.
//


import SwiftUI

/** Custom Grid View*/
struct CGridView <Content:View> : View {
    var rows: Int;
    var cols: Int;
    var content: (Int, Int) -> Content;
    var spacing: CGFloat;
    
    init(rows: Int, cols: Int, spacing: CGFloat, @ViewBuilder content: @escaping (_ row: Int, _ col: Int) -> Content){
        self.content = content;
        self.rows = rows;
        self.cols = cols;
        self.spacing = spacing
        
    }
    
    var body: some View {
        VStack(spacing: self.spacing){
            ForEach(0..<rows, id:\.self){ r in
                HStack(spacing: self.spacing){
                    ForEach(0..<cols, id:\.self) { c in
                        content(r, c)
                    }
                }
            }
        }
    }
}
