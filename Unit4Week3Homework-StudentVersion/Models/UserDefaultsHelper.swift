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
    
    private init() {}
    
    static let manager = UserDefaultsHelper()
    
    func saveZipcode(_ zipcode: String) {
        UserDefaults.standard.set(zipcode, forKey: zipcodeKey)
    }
    
    func getZipcode() -> String? {
        return UserDefaults.standard.object(forKey: zipcodeKey) as? String
    }
}
