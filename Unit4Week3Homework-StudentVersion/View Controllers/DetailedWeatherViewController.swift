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
    
    init(weather: Weather, forecast: Forecast, cityName: String) {
        super.init(nibName: nil, bundle: nil)
        
        detailedView = DetailedWeatherView(frame: UIScreen.main.bounds)
        
        detailedView.configureViews(forWeather: weather, forecast: forecast, andCityName: cityName)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("You cannot implement this!!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        
        setUpDetailedView()
    }
    
    func setUpDetailedView() {
        //maybe have some parameters you can pass in to set things up!!!
        //to do other stuff!!!
        
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
    
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
