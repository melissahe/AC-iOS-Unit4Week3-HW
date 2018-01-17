//
//  UserDefaultsHelper.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

class UserDefaultsHelper {
    
    let zipcodeKey = "zipcodeKey"
    let cityKey = "cityKey"
    
    private init() {}
    
    static let manager = UserDefaultsHelper()
    
    //zipcode
    func saveZipcode(_ zipcode: String) {
        UserDefaults.standard.set(zipcode, forKey: zipcodeKey)
    }
    
    func getZipcode() -> String? {
        return UserDefaults.standard.object(forKey: zipcodeKey) as? String
    }
    
    //city
    func saveCity(withZipcode zipcode: String, andCityName cityName: String) {
        UserDefaults.standard.set([zipcode : cityName], forKey: cityKey)
    }
    
    func getCity(forZipcode zipcode: String) -> String? {
        return UserDefaults.standard.dictionary(forKey: cityKey)?[zipcode] as? String
    }
}
