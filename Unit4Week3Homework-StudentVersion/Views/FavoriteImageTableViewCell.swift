//
//  FavoriteImageTableViewCell.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class FavoriteImageTableViewCell: UITableViewCell {

    lazy var favoriteImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        self.contentView.addSubview(favoriteImageView)
        
        favoriteImageView.translatesAutoresizingMaskIntoConstraints = false
        
        favoriteImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
                favoriteImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
                favoriteImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
                favoriteImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

}
