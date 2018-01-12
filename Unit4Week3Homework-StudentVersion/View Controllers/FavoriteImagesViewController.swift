//
//  FavoriteImagesViewController.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/8/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class FavoriteImagesViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
    
        tableView.register(FavoriteImageTableViewCell.self, forCellReuseIdentifier: "favoriteImageCell")
        
        tableView.dataSource = self
        
        return tableView
    }()
    
    //to do - set up data source variable later
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setUpTableView()
    }
    
    func setUpTableView() {
        let safeAreaLayoutGuide = self.view.safeAreaLayoutGuide
        
        self.view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}

extension FavoriteImagesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteImageCell", for: indexPath) as! FavoriteImageTableViewCell
        
        cell.favoriteImageView.image = #imageLiteral(resourceName: "sunnyw") //CHANGE LATER!!!!!
        
        return cell
    }
    
}
