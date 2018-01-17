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
        
        tableView.estimatedRowHeight = 250
        tableView.rowHeight = UITableViewAutomaticDimension
    
        tableView.register(FavoriteImageTableViewCell.self, forCellReuseIdentifier: "favoriteImageCell")
        
        tableView.dataSource = self
        
        return tableView
    }()
    
    var favoriteImageURLs: [String] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = "Favorite Images"
        
        setUpTableView()
        setUpDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUpDataSource()
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
    
    func setUpDataSource() {
        self.favoriteImageURLs = PixabayDataModel.manager.getFavorites()
    }
}

extension FavoriteImagesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteImageURLs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteImageCell", for: indexPath) as! FavoriteImageTableViewCell
        let currentImageURL = favoriteImageURLs[indexPath.row]
        
        cell.configureCell(withImageURL: currentImageURL)
        
        return cell
    }
    
}
