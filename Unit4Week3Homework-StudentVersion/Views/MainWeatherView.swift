//
//  MainWeatherView.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/8/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class MainWeatherView: UIView {
    
    var textLabelTopAnchorConstraint = NSLayoutConstraint()
    
    //set up objects
    lazy var cityNameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "7-Day Forecast"
        label.textAlignment = .center
        label.numberOfLines = 0
        //maybe change later?
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor(red: 0.651, green: 0.855, blue: 0.859, alpha: 1)
        
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.register(MainWeatherCollectionViewCell.self, forCellWithReuseIdentifier: "weatherCell")
        
        return collectionView
    }()
    
    lazy var noResultsLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var zipcodeTextField: UITextField = {
        let textField = UITextField()
        
        textField.textAlignment = .center
        textField.placeholder = "Enter Zipcode Here..."
        textField.keyboardType = .numbersAndPunctuation
        
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setUpViewConstraints()
    }
    
    private func setUpViewConstraints() {
        //to do
        setUpCityNameLabel()
        setUpCollectionView()
        setUpNoResultsLabel()
        setUpZipcodeTextField()
    }
    
    private func setUpCityNameLabel() {
        addSubview(cityNameLabel)
        
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        cityNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        cityNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        cityNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }
    
    private func setUpCollectionView() {
        addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 16).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        collectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.40).isActive = true
        
        collectionView.layer.masksToBounds = true
        collectionView.layer.cornerRadius = 20
    }
    
    private func setUpNoResultsLabel() {
        addSubview(noResultsLabel)
        
        noResultsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        noResultsLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 16).isActive = true
        noResultsLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        noResultsLabel.bounds = CGRect(x: 0, y: 0, width: self.bounds.width, height: 0)
    
    }
    
    private func setUpZipcodeTextField() {
        addSubview(zipcodeTextField)
        
        zipcodeTextField.translatesAutoresizingMaskIntoConstraints = false
        
        textLabelTopAnchorConstraint = zipcodeTextField.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 16)
        
        textLabelTopAnchorConstraint.isActive = true
        
        zipcodeTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        zipcodeTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        zipcodeTextField.heightAnchor.constraint(equalTo: cityNameLabel.heightAnchor).isActive = true
        
        zipcodeTextField.layer.masksToBounds = true
        zipcodeTextField.layer.borderWidth = 1
        zipcodeTextField.layer.borderColor = UIColor.black.cgColor
        zipcodeTextField.layer.cornerRadius = 10
    }
    
}

//MARK: - Animation Functions

//Extra Credit

extension MainWeatherView {
    func animateAddNoResultsLabel() {
        noResultsLabel.text = "No Results Available"
        textLabelTopAnchorConstraint.isActive = false
        
        textLabelTopAnchorConstraint = zipcodeTextField.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 48)
        
        textLabelTopAnchorConstraint.isActive = true
        
        UIView.animateKeyframes(withDuration: 1.0, delay: 0, options: UIViewKeyframeAnimationOptions.calculationModeCubic, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0, animations: {
                self.layoutIfNeeded()
            })
            
        }, completion: nil)
    }
    
    func animateRemoveNoResultsLabel() {
        
        textLabelTopAnchorConstraint.isActive = false
        
        textLabelTopAnchorConstraint = zipcodeTextField.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 16)
        
        textLabelTopAnchorConstraint.isActive = true
        
        UIView.animateKeyframes(withDuration: 1.0, delay: 0, options: UIViewKeyframeAnimationOptions.calculationModeCubic, animations: {

            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0, animations: {
                self.noResultsLabel.text = ""
            })

            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0, animations: {
                self.layoutIfNeeded()
            })

        }, completion: nil)
    }
}
