//
//  WeatherModel.swift
//  SwiftUI-Weather
//
//  Created by Willian Peres on 21/10/23.
//

import Foundation

class WeatherModel {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    init(dayOfWeek: String, imageName: String, temperature: Int) {
        self.dayOfWeek = dayOfWeek
        self.imageName = imageName
        self.temperature = temperature
    }
}
