//
//  VariableElmentView.swift
//  RGBSliders
//
//  Created by Kasharin Mikhail on 12.06.2023.
//

import SwiftUI

struct DynamicColorView: View {
    @FocusState private var isTextFieldFocused: Bool
    @Binding var sliderValue: Double
    @State private var textFieldValue = 0.0
    @State private var showAlert = false
    
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(sliderValue))")
                .frame(width: 35, alignment: .leading)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .onChange(of: sliderValue) { newValue in
                    textFieldValue = newValue
                }
                .accentColor(color)
                .animation(.linear, value: sliderValue)
                .disabled(isTextFieldFocused)
            
            TextField(
                "0",
                value: $textFieldValue,
                formatter: NumberFormatter(),
                onEditingChanged: editingChanged
                
            )
                .frame(width: 45)
                .multilineTextAlignment(.leading)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .focused( $isTextFieldFocused )
                .alert(
                    "Invalid Format",
                    isPresented: $showAlert,
                    actions: { Button("OK") { textFieldValue = sliderValue } },
                    message: { Text("Please enter a value between 0 and 255") }
                )
        }
        .onAppear { textFieldValue = sliderValue }
        .frame(width: UIScreen.main.bounds.width - 32)
    }
    
    private func editingChanged(_ editing: Bool) {
        if !editing, !(0...255).contains(textFieldValue) {
            showAlert.toggle()
            return
        }
        sliderValue = textFieldValue
    }
}

