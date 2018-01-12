//
//  DetailedWeatherView.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/10/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class DetailedWeatherView: UIView {
    
    lazy var dismissView: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .clear
        
        return button
    }()
    
    lazy var detailedView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white //to change to a different color later?
        
        return view
    }()
    
    lazy var dismissButton: UIButton = {
        let button = UIButton()
        
        button.setImage(#imageLiteral(resourceName: "dismissButtonIcon"), for: .normal)
        
        return button
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.text = "Date Label" //delete me later
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var cityImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "sunnywn") //to delete later!!!!
        imageView.setContentHuggingPriority(UILayoutPriority(249), for: .vertical)
        
        return imageView
    }()
    
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
    
    lazy var weatherTitleStackView: UIStackView = {
        let stackView = WeatherLabelStackView()
        
        return stackView
    }()
    
    lazy var weatherLabelStackView: UIStackView = {
        let stackView = WeatherLabelStackView()
        
        stackView.arrangedSubviews.forEach{
            ($0 as! UILabel).textAlignment = .right
        }
        
        return stackView
    }()
    
    //TO DO - SET UP CONFIGURING VIEWS AND ALSO THE SAVE BUTTON!!!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    override func setNeedsLayout() {
        animateDetailedViewTransitionIn()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    //to do later
    func configureView() {
        //dependency injection stuff
    }
    
    private func commonInit() {
        backgroundColor = .clear
        configureView()
        setUpViewConstraints()
    }
    
    private func setUpViewConstraints() {
        setUpBlurView()
        setUpDismissView()
        setUpDetailedView()
        setUpDismissButton()
        setUpDateLabel()
        setUpWeatherTitleStackView()
        setUpWeatherLabelStackView()
        setUpCityImageView()
    }
    
    private func setUpBlurView() {
        let blurEffect = UIBlurEffect(style: .prominent)
        
        let blurView = UIVisualEffectView(frame: UIScreen.main.bounds)
        
        blurView.effect = blurEffect
        
        addSubview(blurView)
    }
    
    private func setUpDismissView() {
        addSubview(dismissView)
        dismissView.translatesAutoresizingMaskIntoConstraints = false
        
        dismissView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        dismissView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        dismissView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        dismissView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func setUpDetailedView() {
        addSubview(detailedView)
     
        detailedView.translatesAutoresizingMaskIntoConstraints = false
        
        detailedView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        detailedView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        detailedView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75).isActive = true
        detailedView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.85).isActive = true
        
        detailedView.layer.masksToBounds = true
        detailedView.layer.cornerRadius = 20
    }
    
    private func setUpDismissButton() {
        detailedView.addSubview(dismissButton)
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        
        dismissButton.topAnchor.constraint(equalTo: detailedView.topAnchor, constant: 8).isActive = true
        
        dismissButton.trailingAnchor.constraint(equalTo: detailedView.trailingAnchor, constant: -8).isActive = true
    }
    
    private func setUpDateLabel() {
        detailedView.addSubview(dateLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.topAnchor.constraint(equalTo: dismissButton.bottomAnchor).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: detailedView.leadingAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: detailedView.trailingAnchor).isActive = true
        dateLabel.heightAnchor.constraint(equalTo: detailedView.heightAnchor, multiplier: 0.10).isActive = true
    }
    
    private func setUpWeatherTitleStackView() {

        detailedView.addSubview(weatherTitleStackView)
        
        weatherTitleStackView.translatesAutoresizingMaskIntoConstraints = false
        weatherTitleStackView.bottomAnchor.constraint(equalTo: detailedView.bottomAnchor, constant: -16).isActive = true
        weatherTitleStackView.leadingAnchor.constraint(equalTo: detailedView.leadingAnchor, constant: 16).isActive = true
        
            weatherTitleStackView.widthAnchor.constraint(equalTo: detailedView.widthAnchor, multiplier: 0.5, constant: -16).isActive = true
        
        weatherTitleStackView.heightAnchor.constraint(equalTo: detailedView.heightAnchor, multiplier: 0.30).isActive = true
        
    }
    
    private func setUpWeatherLabelStackView() {
        
        detailedView.addSubview(weatherLabelStackView)
        
        weatherLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        weatherLabelStackView.bottomAnchor.constraint(equalTo: detailedView.bottomAnchor, constant: -16).isActive = true
        weatherLabelStackView.trailingAnchor.constraint(equalTo: detailedView.trailingAnchor, constant: -16).isActive = true
        
        weatherLabelStackView.widthAnchor.constraint(equalTo: detailedView.widthAnchor, multiplier: 0.5, constant: -16).isActive = true
        
        weatherLabelStackView.heightAnchor.constraint(equalTo: detailedView.heightAnchor, multiplier: 0.30).isActive = true
        
    }
    
    private func setUpCityImageView() {
        detailedView.addSubview(cityImageView)
        
        cityImageView.translatesAutoresizingMaskIntoConstraints = false
        
        cityImageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 0).isActive = true
        cityImageView.leadingAnchor.constraint(equalTo: detailedView.leadingAnchor).isActive = true
        cityImageView.trailingAnchor.constraint(equalTo: detailedView.trailingAnchor).isActive = true
        cityImageView.bottomAnchor.constraint(equalTo: weatherLabelStackView.topAnchor, constant: -16).isActive = true
    }
    
}

//MARK: - Animation Functions

//Extra Credit

extension DetailedWeatherView {
    func animateDetailedViewTransitionIn() {
        
        let originalPosition = self.detailedView.transform
        
        UIView.animate(withDuration: 0.20, delay: 0.17, usingSpringWithDamping: 1.0, initialSpringVelocity: 5, options: [], animations: {
            self.detailedView.transform = CGAffineTransform(translationX: 0, y: -17)
        }, completion: { _ in
            
            UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.60, initialSpringVelocity: 5, options: [], animations: {
                self.detailedView.transform = originalPosition
            }, completion: nil)
            
        })

    }
    
}
