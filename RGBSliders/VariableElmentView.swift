//
//  VariableElmentView.swift
//  RGBSliders
//
//  Created by Kasharin Mikhail on 12.06.2023.
//

import SwiftUI

struct VariableElementView: View {
    @Binding var colorValue: Double

    let color: Color
    var body: some View {
        HStack(spacing: 8) {
            Text("\(color.description)")
                .frame(width: 50, alignment: .leading)
            Text("\(lround(colorValue))")
                .frame(width: 35, alignment: .leading)
            Slider(value: $colorValue, in: 0...255, step: 1)
                .tint(color)
            TextField("0", value: $colorValue, formatter: NumberFormatter())
                .frame(width: 35)
                .multilineTextAlignment(.center)
                .keyboardType(.decimalPad)
                .onChange(of: colorValue) { newValue in
                    colorValue = min(max(newValue, 0), 255)
                }
        }
        .frame(width: UIScreen.main.bounds.width - 32)
    }
}
