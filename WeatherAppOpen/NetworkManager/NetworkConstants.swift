//
//  NetworkConstants.swift
//  WeatherAppOpen
//
//  Created by Baraa Wawi on 09/09/2024.
//

import Foundation

struct NetworkConstants{
    
    static let apiKey = "cdfb1cd719564cfe845180051240909"
    static let responseFormat = "json"
    static let weatherUrl = "https://api.worldweatheronline.com/premium/v1/weather.ashx?key=\(apiKey)&format=\(responseFormat)"
    
}
