//
//  WeatherAPIClient.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

class WeatherAPIClient {
    private init() {}
    static let manager = WeatherAPIClient()
    private let accessID = "g4qZZgkhXMsNxq8FGcqPi"
    private let apiKey = "wasdGv7DYaU4EvIKrtosU73bzds3iTU2ueFvhJXz"
    
    func getWeather(fromZipcode zipcode: String, completionHandler: @escaping (Weather) -> Void, errorHandler: @escaping (Error) -> Void) {
        
        let urlString = "https://api.aerisapi.com/forecasts/\(zipcode)?client_id=\(accessID)&client_secret=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            errorHandler(AppError.badURL(url: urlString))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.manager.performDataTask(with: request, completionHandler: { (data) in
            let jsonDecoder = JSONDecoder()
            
            do {
                
                let results = try jsonDecoder.decode(Results.self, from: data)
                
                completionHandler(results.weather[0])
            } catch {
                errorHandler(AppError.cannotParseJSON(rawError: error))
            }
            
        }, errorHandler: errorHandler)
    }
}
