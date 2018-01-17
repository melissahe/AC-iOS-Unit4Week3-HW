//
//  PixabayAPIClient.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/17/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class PixabayAPIClient {
    private init() {}
    
    static let manager = PixabayAPIClient()
    
    let apiKey = "7289848-451c3dc743d77a89fabd39354"
    
    func getPixabayImageLink(cityName: String, completionHandler: @escaping (URL) -> Void, errorHandler: @escaping (Error) -> Void) {
        
        guard let formattedCityName = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            print("bad city name for url: \(cityName)")
            
            return
        }
        
        let urlString = "https://pixabay.com/api/?key=\(apiKey)&q=\(formattedCityName)"
        
        guard let url = URL(string: urlString) else {
            errorHandler(AppError.badURL(url: urlString))
            
            return
        }
       
       let request = URLRequest(url: url)
        NetworkHelper.manager.performDataTask(with: request, completionHandler: { (data) in
            
            do {
                let pixabay = try JSONDecoder().decode(ResultsWrapper.self, from: data)
                
                let randomIndex = Int(arc4random_uniform(UInt32(pixabay.hits.count)))
                
                let randomPixabay = pixabay.hits[randomIndex]
                
                completionHandler(randomPixabay.imageURL)
            } catch let error {
                errorHandler(AppError.cannotParseJSON(rawError: error))
            }
            
        }, errorHandler: errorHandler)
    }
}
