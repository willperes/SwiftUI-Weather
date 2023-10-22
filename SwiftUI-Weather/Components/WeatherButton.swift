//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Willian Peres on 21/10/23.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color

    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}

#Preview {
    WeatherButton(title: "Mudar hora do dia", textColor: .blue, backgroundColor: .white)
}
