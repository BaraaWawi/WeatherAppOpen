//
//  CacheManager.swift
//  WeatherAppOpen
//
//  Created by Baraa Wawi on 10/09/2024.
//

import Foundation

class CacheManager {
    static let shared = CacheManager()
    let cacheWeatherKey = "weatherDataCache"
    private init() {}
    
    private let cache = NSCache<NSString, NSData>()

    //MARK: - Saving
    func saveToCache(data: [CountryWeatherModel]) {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(data) {
            cache.setObject(encodedData as NSData, forKey: cacheWeatherKey as NSString)
        }
    }

    //MARK: - Loading
    func loadCachedData() -> [CountryWeatherModel]? {

        if let cachedData = cache.object(forKey: cacheWeatherKey as NSString) as Data? {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([CountryWeatherModel].self, from: cachedData) {
                return decodedData
            }
        }
        return nil
    }
    
    //MARK: - Clearing
    func clearAllCache() {
        cache.removeAllObjects()
    }
    
}


