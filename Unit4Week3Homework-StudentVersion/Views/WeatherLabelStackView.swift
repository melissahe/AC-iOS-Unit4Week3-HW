//
//  WeatherTitleLabelStackView.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class WeatherLabelStackView: UIStackView {

    //detail view labels
    lazy var highTempLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "high"
        
        return label
    }()
    
    lazy var lowTempLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "low"
        
        return label
    }()
    
    lazy var sunriseLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "sunrise"
        
        return label
    }()
    
    lazy var sunsetLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "sunset"
        
        return label
    }()
    
    lazy var windspeedLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "windspeed"
        return label
    }()
    
    lazy var precipitationLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "precipitation"
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func configureViews(withForecast forecast: Forecast) {
        let sunriseTime = forecast.sunriseTime.components(separatedBy: "T")[1].components(separatedBy: "-")[0]
        let sunsetTime = forecast.sunsetTime.components(separatedBy: "T")[1].components(separatedBy: "-")[0]
        
        //        sunriseLabel.text = sunriseTime
        //        sunsetLabel.text = sunsetTime
        //
        //        //start extra credit here!!! - to do
        //
        //        highTempLabel.text = forecast.maxTempF.description + "ºF"
        //        lowTempLabel.text = forecast.minTempF.description + "ºF"
        //        windspeedLabel.text = forecast.windSpeedMPH.description + " MPH"
        //        precipitationLabel.text = forecast.precipitationIN.description + " IN"
        //
        //setup image later - using lat and long of the weather?
    }
    
    private func commonInit() {
        self.distribution = .fillEqually
        self.alignment = .fill
        self.axis = .vertical
        self.spacing = 3
        
        setUpViews()
    }
    
    private func setUpViews() {
        self.addArrangedSubview(highTempLabel)
        self.addArrangedSubview(lowTempLabel)
        self.addArrangedSubview(sunriseLabel)
        self.addArrangedSubview(sunsetLabel)
        self.addArrangedSubview(windspeedLabel)
        self.addArrangedSubview(precipitationLabel)
    }

}
