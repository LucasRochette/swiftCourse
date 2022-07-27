//
//  WeatherDay.swift
//  Ratp
//
//  Created by Lucas on 27/07/2022.
//

import Foundation

class WeatherDay {
    var date: String
    var tempMin: Double
    var tempMax: Double
    var description: String
    
    init(date: String, tempMin: Double, tempMax: Double, description: String) {
        self.date = date
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.description = description
    }
    
    
}
