//
//  DrawingView.swift
//  SwiftUICanvas
//
//  Created by Egemen TÜRK on 28.01.2023.
//

import SwiftUI

struct DrawingView: View {
    
    @State private var lines = [Line]()
    @State private var selectedColor: Color = .black
    @State private var selectedLineWidth: CGFloat = 1
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                CanvasView(lines: $lines,
                           selectedColor: $selectedColor,
                           selectedLineWidth: $selectedLineWidth)
                HStack {
                    ColorPickerView(selectedColor: $selectedColor)
                    SliderView(selectedLineWidth: $selectedLineWidth)
                        .frame(width: geo.size.width / 2)
                    Text(String(format: "%.f", selectedLineWidth))
                    
                }
            }
        }
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
    }
}
