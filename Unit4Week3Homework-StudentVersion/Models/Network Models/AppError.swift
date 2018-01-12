//
//  AppError.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

enum AppError: Error {
    case badURL(url: String)
    case badImageURL(url: String)
    case badData
    case badResponseCode(code: Int)
    case cannotParseJSON(rawError: Error)
    case noInternet
    case other(rawError: Error)
}
