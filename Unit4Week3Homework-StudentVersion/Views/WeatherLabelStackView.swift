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
        label.text = "high" //DELETE LATER!!!
        //maybe do font as well!!!1
        
        return label
    }()
    
    lazy var lowTempLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "low" //DELETE LATER!!!
        //maybe do font as well!!!1
        
        return label
    }()
    
    lazy var sunriseLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "sunrise" //DELETE LATER!!!
        //maybe do font as well!!!1
        
        return label
    }()
    
    lazy var sunsetLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "sunset" //DELETE LATER!!!
        //maybe do font as well!!!1
        
        return label
    }()
    
    lazy var windspeedLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "windspeed" //DELETE LATER!!!
        //maybe do font as well!!!1
        
        return label
    }()
    
    lazy var precipitationLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "precipitation" //DELETE LATER!!!
        //maybe do font as well!!!1
        
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
