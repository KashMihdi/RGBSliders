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

    
    var body: some View {
        ZStack {
            Color(.cyan).ignoresSafeArea()
            VStack {
                ColorView(
                    redColorValue: redColorValue,
                    greenColorValue: greenColorValue,
                    blueColorValue: blueColorValue
                )
                .padding(.vertical, 16)
                
                DynamicColorView(sliderValue: $redColorValue,color: .red)
                DynamicColorView(sliderValue: $greenColorValue,color: .green)
                DynamicColorView(sliderValue: $blueColorValue,color: .blue)

                Spacer()
            }

            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done", action: hideKeyboard)
                }
            }
        }
        .onTapGesture(perform: hideKeyboard)
    }
}

extension ContentView {
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
