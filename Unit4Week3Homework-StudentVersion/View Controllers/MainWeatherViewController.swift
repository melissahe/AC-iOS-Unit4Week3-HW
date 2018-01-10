//
//  ViewController.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q  on 1/5/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class MainWeatherViewController: UIViewController {

    lazy var mainWeatherView: MainWeatherView = {
        let safeAreaLayoutGuide = self.view.safeAreaLayoutGuide
        
        let view = MainWeatherView(frame: safeAreaLayoutGuide.layoutFrame)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Search"
        //load the actual zipcode first, to get city, then use dependency injection to pass the city and info to the main weather view, which will have a function that sets up all that stuff using the info that was passed in
        
        setUpMainWeatherView()
        
        //figure out collection view and labels and stuff?
    }
    
    func setUpMainWeatherView() {
        let safeAreaLayoutGuide = self.view.safeAreaLayoutGuide
        
        self.view.addSubview(mainWeatherView)
        
        self.mainWeatherView.translatesAutoresizingMaskIntoConstraints = false
        self.mainWeatherView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        self.mainWeatherView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.mainWeatherView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.mainWeatherView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }


}

