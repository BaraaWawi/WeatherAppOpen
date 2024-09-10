//
//  NetworkManager.swift
//  WeatherAppOpen
//
//  Created by Baraa Wawi on 09/09/2024.
//

import Foundation

enum NetworkError : Error{
    case urlError
    case canNotParseData
}

class NetworkManager{
    
    static func getWeatherRequest(cities: [String] , completionHandler: @escaping (_ result: Result<[String: WeatherModel], NetworkError>) -> Void) {

        
        print("NETWORK IS CALLED")
        var results = [String: WeatherModel]()
        let dispatchGroup = DispatchGroup()
        
        for city in cities {
            dispatchGroup.enter()
            let urlString = "\(NetworkConstants.weatherUrl)&q=\(city)"
            
            guard let url = URL(string: urlString) else {
                completionHandler(.failure(.urlError))
                dispatchGroup.leave()
                continue
            }
            
            print("URL = \(urlString)")
            URLSession.shared.dataTask(with: url){response , urlResponse,error in
                if error == nil , let response{
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    if let resultData = try? decoder.decode(WeatherModel.self, from: response){

                        results[city] = resultData
                        
                    }
                    
                }
                dispatchGroup.leave()
                
            }.resume()
            
        }
        
        dispatchGroup.notify(queue: .main){
            if !results.isEmpty{
                completionHandler(.success(results))

            }else{
                completionHandler(.failure(.canNotParseData))

            }
        }
        
    }//end getWeatherRequest
    
    
}
