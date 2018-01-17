//
//  Weather.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

struct Results: Codable {
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case weather = "response"
    }
}

struct Weather: Codable {
    let location: Location
    let forecasts: [Forecast]

    enum CodingKeys: String, CodingKey {
        case location = "loc"
        case forecasts = "periods"
    }
}

struct Location: Codable {
    let longitude: Double
    let latitude: Double
    
    enum CodingKeys: String, CodingKey {
        case longitude = "long"
        case latitude = "lat"
    }
}

struct Forecast: Codable {
    let date: String
    let maxTempC: Int
    let maxTempF: Int
    let minTempC: Int
    let minTempF: Int
    let precipitationMM: Double
    let precipitationIN: Double
    let windSpeedKPH: Int
    let windSpeedMPH: Int
    let icon: String
    let sunriseTime: String
    let sunsetTime: String
    
    enum CodingKeys: String, CodingKey {
        case maxTempC, maxTempF, minTempC, minTempF, windSpeedKPH, windSpeedMPH, icon
        case date = "dateTimeISO"
        case precipitationMM = "precipMM"
        case precipitationIN = "precipIN"
        case sunriseTime = "sunriseISO"
        case sunsetTime = "sunsetISO"
    }
}

