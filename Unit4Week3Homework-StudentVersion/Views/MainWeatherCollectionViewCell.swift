//
//  MainWeatherCollectionViewCell.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/9/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class MainWeatherCollectionViewCell: UICollectionViewCell {
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = .white
        
        return label
    }()
    
    lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    lazy var highTempLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = .white
        
        return label
    }()
    
    lazy var lowTempLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = .white
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func configureCell(withForecast forecast: Forecast) {
        
        let date = forecast.date.components(separatedBy: "T")[0]
        
        dateLabel.text = date
        highTempLabel.text = "\(forecast.maxTempF)ºF"
        lowTempLabel.text = "\(forecast.minTempF)ºF"
        let weatherName = forecast.icon.components(separatedBy: ".")[0]
        
        configureImages(for: weatherName)
    }
    
    private func commonInit() {
        self.backgroundColor = UIColor(red: 0.984, green: 0.761, blue: 0.8, alpha: 1)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        setUpDateLabel()
        setUpLowTempLabel()
        setUpHighTempLabel()
        setUpWeatherImageView()
    }
    
    private func setUpDateLabel() {
        addSubview(dateLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        dateLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true
    }
    
    private func setUpLowTempLabel() {
        addSubview(lowTempLabel)
        
        lowTempLabel.translatesAutoresizingMaskIntoConstraints = false
        
        lowTempLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        lowTempLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        lowTempLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lowTempLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true
    }
    
    private func setUpHighTempLabel() {
        addSubview(highTempLabel)
        
        highTempLabel.translatesAutoresizingMaskIntoConstraints = false
        
        highTempLabel.bottomAnchor.constraint(equalTo: lowTempLabel.topAnchor, constant: 10).isActive = true
        highTempLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        highTempLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        highTempLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true
    }
    
    private func setUpWeatherImageView() {
        addSubview(weatherImageView)
        
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        
        weatherImageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8).isActive = true
        weatherImageView.bottomAnchor.constraint(equalTo: highTempLabel.topAnchor, constant: -8).isActive = true
        weatherImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        weatherImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
    }
    
    private func configureImages(for weatherName: String) {
        self.weatherImageView.image = UIImage(named: weatherName)
    }
    
}
