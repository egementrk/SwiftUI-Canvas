//
//  CanvasView.swift
//  SwiftUICanvas
//
//  Created by Egemen TÜRK on 28.01.2023.
//

import SwiftUI

struct CanvasView: View {
    
    @Binding var lines: [Line]
    @Binding var selectedColor: Color
    @Binding var selectedLineWidth: CGFloat
    
    var body: some View {
        Canvas { context, size in
            for line in lines {
                
                var path = Path()
                path.addLines(line.points)
                
                context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
            }
        }.gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
            let newLocation = value.location
            
            if value.translation.width + value.translation.height == 0 {
                lines.append(Line(points: [newLocation],
                                  color: selectedColor,
                                  lineWidth: selectedLineWidth))
            } else {
                let index = lines.count - 1
                lines[index].points.append(newLocation)
                
            }
        }))
    }
}

struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView(lines: .constant([Line(points: [CGPoint(x: 1, y: 1)],
                                         color: .black, lineWidth: 1)]),
                   selectedColor: .constant(.black),
                   selectedLineWidth: .constant(1))
    }
}
