//
//  DetailedWeatherViewController.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/8/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class DetailedWeatherViewController: UIViewController {

    //get weather and stuff from dependency injection
    var detailedView: DetailedWeatherView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpDetailedView()
    }
    
    //TO DO NEXT!!
    
    func setUpDetailedView() {
        //maybe have some parameters you can pass in to set things up!!!
        detailedView = DetailedWeatherView(frame: UIScreen.main.bounds)
        //to do other stuff!!!
        
        self.view.backgroundColor = .clear
        
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
