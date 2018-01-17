//
//  PixabayDataModel.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/17/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class PixabayDataModel {
    private init() {}
    
    private let pathName = "pixabay.plist"
    
    static let manager = PixabayDataModel()
    
    private let fileManager = FileManager.default
    
    private var favoriteImageURLs: [String] = [] {
        didSet {
            saveFavorites()
        }
    }
    
    //document directory
    private func documentDirectory() -> URL {
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        
        return urls[0]
    }
    
    //custom file path in document directory
    private func dataFilePath(fileName: String) -> URL {
        return documentDirectory().appendingPathComponent(fileName)
    }
    
    //save
    private func saveFavorites() {
        let encoder = PropertyListEncoder()
        let filePath = dataFilePath(fileName: pathName)
        
        do {
            let data = try encoder.encode(favoriteImageURLs)
            try data.write(to: filePath)
            print("save successful!!")
        } catch let error {
            print(error)
        }
        
    }
    
    //load
    func loadFavorites() {
        let decoder = PropertyListDecoder()
        let filePath = dataFilePath(fileName: pathName)
        
        do {
            let data = try Data.init(contentsOf: filePath)
            let favorites = try decoder.decode([String].self, from: data)
            
            self.favoriteImageURLs = favorites
            print("loaded favorites!")
        } catch let error {
            print(error)
        }
        
    }
    
    //add
    func addFavorites(withImage image: UIImage, andURL newURL: URL) {
        let lastURLComponent = newURL.lastPathComponent
        let filePath = dataFilePath(fileName: lastURLComponent)

        
        if !favoriteImageURLs.contains(lastURLComponent) {
            self.favoriteImageURLs.insert(lastURLComponent, at: 0)
            
            guard let data = UIImagePNGRepresentation(image) else {
                return
            }
            
            do {
                try data.write(to: filePath)
                print("add successful!1")
            } catch {
                print(error)
            }
            
        }
    }
    
    //get
    func getFavorites() -> [String] {
        return favoriteImageURLs
    }
    
    func getImage(withImageURL imageURL: String) -> UIImage? {
        let filePath = dataFilePath(fileName: imageURL)
        
        do {
            let data = try Data(contentsOf: filePath)
            
            return UIImage(data: data)
        } catch {
            print(error)
            return nil
        }
    }
    
}
