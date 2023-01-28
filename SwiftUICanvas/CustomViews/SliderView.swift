//
//  SliderView.swift
//  SwiftUICanvas
//
//  Created by Egemen TÜRK on 28.01.2023.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var selectedLineWidth: CGFloat
    var body: some View {
        Slider(value: $selectedLineWidth,
               in: 1...10) {}
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(selectedLineWidth: .constant(1))
    }
}
