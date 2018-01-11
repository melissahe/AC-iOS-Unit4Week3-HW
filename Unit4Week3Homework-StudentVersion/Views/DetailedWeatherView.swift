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
        setUpDateLabel()
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
        //do some animation stuff for detailed view!!!!!! - maybe in view did load in detailed view controller
        
        addSubview(detailedView)
     
        detailedView.translatesAutoresizingMaskIntoConstraints = false
        
        detailedView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        detailedView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        detailedView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
        detailedView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.85).isActive = true
        
        detailedView.layer.masksToBounds = true
        detailedView.layer.cornerRadius = 20
    }
    
    private func setUpDateLabel() {
        detailedView.addSubview(dateLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.topAnchor.constraint(equalTo: detailedView.topAnchor).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: detailedView.leadingAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: detailedView.trailingAnchor).isActive = true
        dateLabel.heightAnchor.constraint(equalTo: detailedView.heightAnchor, multiplier: 0.20).isActive = true
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
    
    //should be called when the view gets dismissed
    func animateDetailedViewTransitionOut() {
        
    }
}
