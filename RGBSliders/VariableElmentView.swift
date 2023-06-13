//
//  VariableElmentView.swift
//  RGBSliders
//
//  Created by Kasharin Mikhail on 12.06.2023.
//

import SwiftUI

struct VariableElementView: View {
    @Binding var colorValue: Double
    @State var textFieldValue = 0.0
    let color: Color
    
    var body: some View {
        HStack(spacing: 8) {
            Text("\(lround(colorValue))")
                .frame(width: 35, alignment: .leading)
            Slider(value: $colorValue, in: 0...255, step: 1)
                .onChange(of: colorValue) { _ in
                    textFieldValue = colorValue
                }
                .accentColor(color)
            TextField(
                "0",
                value: $textFieldValue,
                formatter: NumberFormatter(),
                onEditingChanged: editingChanged,
                onCommit: updateSliderValue
            )
            .frame(width: 35)
            .multilineTextAlignment(.center)
            .keyboardType(.decimalPad)
        }
        .onAppear { textFieldValue = colorValue }
        .frame(width: UIScreen.main.bounds.width - 32)
    }
    
    private func editingChanged(_ editing: Bool) {
        if !editing {
            updateSliderValue()
        }
    }
    
    private func updateSliderValue() {
        withAnimation {
            colorValue = textFieldValue
        }
    }}

