//
//  ColorView.swift
//  RGBSliders
//
//  Created by Kasharin Mikhail on 13.06.2023.
//

import SwiftUI

struct ColorView: View {
    let redColorValue: Double
    let greenColorValue: Double
    let blueColorValue: Double
    
    var body: some View {
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
                height: UIScreen.main.bounds.height / 4.5
            )
            .overlay(RoundedRectangle(cornerRadius: 25)
                .stroke(Color(.white), lineWidth: 4))
    }
}

