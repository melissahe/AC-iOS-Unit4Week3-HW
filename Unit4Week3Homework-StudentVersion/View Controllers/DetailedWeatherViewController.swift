//
//  DetailedWeatherViewController.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/8/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class DetailedWeatherViewController: UIViewController {

    var detailedView: DetailedWeatherView!
    
    init(forecast: Forecast, cityName: String) {
        super.init(nibName: nil, bundle: nil)
        
        detailedView = DetailedWeatherView(frame: UIScreen.main.bounds)
        
        detailedView.configureViews(forForecast: forecast, andCityName: cityName)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("You cannot implement this!!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        
        setUpDetailedView()
        setUpSaveButton()
    }
    
    func setUpDetailedView() {
        
        self.view.addSubview(detailedView)
        detailedView.translatesAutoresizingMaskIntoConstraints = false
        
        detailedView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        detailedView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        detailedView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        detailedView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        detailedView.layoutIfNeeded()
        
        detailedView.dismissView.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        detailedView.dismissButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }
    
    func setUpSaveButton() {
        self.detailedView.saveButton.addTarget(self, action: #selector(saveButtonPressed(_:)), for: .touchUpInside)
    }
    
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func saveButtonPressed(_ sender: UIButton) {
        guard let pixabayURL = self.detailedView.currentURL else {
            return
        }
        
        guard let cityImage = self.detailedView.cityImageView.image else {
            return
        }
        
        let image = UIImage(named: "favorite-unfilled")?.withRenderingMode(.alwaysTemplate)
        
        if sender.imageView?.image == image {
            let image = UIImage(named: "favorite-filled")?.withRenderingMode(.alwaysTemplate)
            
            sender.setImage(image, for: .normal)
        } else {
            let alertController = UIAlertController(title: "Error", message: "You already saved this image.\n(Tbh I was just too lazy to make a remove function to remove this image from favorites lolol)", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alertController.addAction(alertAction)
            
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        
        PixabayDataModel.manager.addFavorites(withImage: cityImage, andURL: pixabayURL)
        
        let alertController = UIAlertController(title: "Success", message: "Image was saved to favorites!", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(alertAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
}
