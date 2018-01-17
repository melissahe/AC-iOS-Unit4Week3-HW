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
        
        button.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .vertical)
        
        return button
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var weatherDescriptionLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var cityImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "placeholder")
        imageView.setContentHuggingPriority(UILayoutPriority(249), for: .vertical)
        
        return imageView
    }()
    
    lazy var weatherTitleStackView: UIStackView = {
        let stackView = WeatherLabelStackView()
        
        return stackView
    }()
    
    lazy var weatherLabelStackView: WeatherLabelStackView = {
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
    func configureViews(forWeather weather: Weather, forecast: Forecast, andCityName cityName: String) {
        
        let date = forecast.date.components(separatedBy: "T")[0]
        
        dateLabel.text = date
        
        cityLabel.text = cityName
        
        weatherDescriptionLabel.text = forecast.weatherDescription
        
        let sunriseTime = forecast.sunriseTime.components(separatedBy: "T")[1].components(separatedBy: "-")[0]
        
        let sunsetTime = forecast.sunsetTime.components(separatedBy: "T")[1].components(separatedBy: "-")[0]
        
        weatherLabelStackView.sunriseLabel.text = sunriseTime
        
        weatherLabelStackView.sunsetLabel.text = sunsetTime
        
        //to do - extra credit units!!
        
        weatherLabelStackView.highTempLabel.text = forecast.maxTempF.description + " ºF"
        
        weatherLabelStackView.lowTempLabel.text = forecast.minTempF.description + " ºF"
        
        weatherLabelStackView.windspeedLabel.text = forecast.windSpeedMPH.description + " MPH"
        
        weatherLabelStackView.precipitationLabel.text = forecast.precipitationIN.description + " IN"
        
        configureImage(forWeather: weather)
    }
    
    private func commonInit() {
        backgroundColor = .clear
        setUpViewConstraints()
    }
    
    private func setUpViewConstraints() {
        setUpBlurView()
        setUpDismissView()
        setUpDetailedView()
        setUpDismissButton()
        setUpDateLabel()
        setUpCityLabel()
        setUpWeatherDescriptionLabel()
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
        dateLabel.heightAnchor.constraint(equalTo: detailedView.heightAnchor, multiplier: 0.05).isActive = true
    }
    
    private func setUpCityLabel() {
        detailedView.addSubview(cityLabel)
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        cityLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8).isActive = true
        cityLabel.leadingAnchor.constraint(equalTo: detailedView.leadingAnchor).isActive = true
        cityLabel.trailingAnchor.constraint(equalTo: detailedView.trailingAnchor).isActive = true
        cityLabel.heightAnchor.constraint(equalTo: dateLabel.heightAnchor).isActive = true
    }
    
    private func setUpWeatherDescriptionLabel() {
        detailedView.addSubview(weatherDescriptionLabel)
        
        weatherDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        weatherDescriptionLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 8).isActive = true
        weatherDescriptionLabel.leadingAnchor.constraint(equalTo: detailedView.leadingAnchor).isActive = true
        weatherDescriptionLabel.trailingAnchor.constraint(equalTo: detailedView.trailingAnchor).isActive = true
        weatherDescriptionLabel.heightAnchor.constraint(equalTo: dateLabel.heightAnchor).isActive = true
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
        
        cityImageView.topAnchor.constraint(equalTo: weatherDescriptionLabel.bottomAnchor, constant: 16).isActive = true
        cityImageView.leadingAnchor.constraint(equalTo: detailedView.leadingAnchor).isActive = true
        cityImageView.trailingAnchor.constraint(equalTo: detailedView.trailingAnchor).isActive = true
        cityImageView.bottomAnchor.constraint(equalTo: weatherLabelStackView.topAnchor, constant: -16).isActive = true
    }
    
    //to do
    private func configureImage(forWeather weather: Weather) {
        //to do - use pixabay api to get image!!
        self.layoutIfNeeded()
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
