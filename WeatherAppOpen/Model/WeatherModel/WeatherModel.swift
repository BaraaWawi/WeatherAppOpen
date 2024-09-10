//
//  WeatherModel.swift
//  WeatherAppOpen
//
//  Created by Baraa Wawi on 09/09/2024.
//

import Foundation

struct WeatherModel : Codable {
    let data : DataModel
}

struct DataModel : Codable{
    let weather : [WeatherInfoModel]
}

struct WeatherInfoModel : Codable{
    let mintempC : String
    let maxtempC : String
    let avgtempC : String
    let sunHour : String
}

struct CountryWeatherModel : Codable{
    let city: String
    let weather: [WeatherInfoModel]

}
