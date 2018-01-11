//
//  DetailedWeatherView.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/10/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class DetailedWeatherView: UIView {

    lazy var dateLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.text = "Date Label" //delete me later
        label.numberOfLines = 0
        
        return label
    }()
    
    //TO DO - FINISH THE OTHER OBJECTS!!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setUpViews()
    }
    
    private func setUpViews() {
        setUpDateLabel()
    }
    
    private func setUpDateLabel() {
        addSubview(dateLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        dateLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.20).isActive = true
    }
    
}
