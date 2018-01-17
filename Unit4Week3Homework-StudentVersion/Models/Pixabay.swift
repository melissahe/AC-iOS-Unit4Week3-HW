//
//  Pixabay.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/17/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

struct ResultsWrapper: Codable {
    let hits: [PixabayImage]
}

struct PixabayImage: Codable {
    let imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "webformatURL"
    }
}
