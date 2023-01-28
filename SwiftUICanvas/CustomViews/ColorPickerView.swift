//
//  ColorPicker.swift
//  SwiftUICanvas
//
//  Created by Egemen TÜRK on 28.01.2023.
//

import SwiftUI

struct ColorPickerView: View {
    
    @Binding var selectedColor: Color
    var body: some View {
        ColorPicker ("Color", selection: $selectedColor)
            .labelsHidden()
    }
}

struct ColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView(selectedColor: .constant(.black))
    }
}
