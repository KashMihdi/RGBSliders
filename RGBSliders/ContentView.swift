//
//  ContentView.swift
//  RGBSliders
//
//  Created by Kasharin Mikhail on 12.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var redColorValue = Double.random(in: 0...255)
    @State private var greenColorValue = Double.random(in: 0...255)
    @State private var blueColorValue = Double.random(in: 0...255)
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        ZStack {
            Color(.cyan).ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(
                        Color(
                            red: redColorValue / 255 ,
                            green: greenColorValue / 255,
                            blue: blueColorValue / 255
                        )
                    )
                    .frame(
                        width: UIScreen.main.bounds.width - 32,
                        height: UIScreen.main.bounds.height / 3
                    )
                    .overlay(RoundedRectangle(cornerRadius: 25)
                        .stroke(Color(.white), lineWidth: 4))
                    .padding(.vertical, 16)
                
                VariableElementView(colorValue: $redColorValue, color: .red)
                VariableElementView(colorValue: $greenColorValue, color: .green)
                VariableElementView(colorValue: $blueColorValue, color: .blue)
                
                Spacer()
            }
            .focused($isTextFieldFocused)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isTextFieldFocused = false
                    }
                }
            }
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
