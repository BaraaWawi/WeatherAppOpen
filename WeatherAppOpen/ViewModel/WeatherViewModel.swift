//
//  WeatherViewModel.swift
//  WeatherAppOpen
//
//  Created by Baraa Wawi on 09/09/2024.
//

import Foundation

typealias voidClosure = (() -> Void)

class WeatherViewModel {
    //MARK: - Properties & variables
    var weatherData = [CountryWeatherModel(city: "", weather: [])]
    
    
    //MARK: - api calling
    func getItemsList(isSearching : Bool = false ,city : String? = nil,completion: @escaping voidClosure){
        
        var citiesArray: [String] = ["amman", "aqaba", "irbid"] // Default cities
        
        if let city, isSearching{
            citiesArray = [city]
        }
        // Load cached data if exists
        if let cachedData = CacheManager.shared.loadCachedData(), !isSearching{
            
            self.weatherData = cachedData
            completion()
            return
        }
        
        NetworkManager.getWeatherRequest(cities:citiesArray) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let data):
                
                self.weatherData = data.map { (city, weatherModel) in
                    let weather = weatherModel.data.weather
                    return CountryWeatherModel(city: city, weather: weather)
                    
                }
                if !isSearching{ // if it is not searching then cache the data
                    CacheManager.shared.saveToCache(data: self.weatherData)
                }
                
                completion()
            case .failure(let error):
                print("Error = \(error)")
                self.weatherData = []
                completion()
                
            }
        }
    }
    
    
}//end WeatherViewModel
