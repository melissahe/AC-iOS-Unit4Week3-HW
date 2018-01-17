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
        imageView.setContentHuggingPriority(UILayoutPriority(rawValue: 750), for: .vertical)
        
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
    
    func configureCell(withImageURL imageURL: String) {
        guard let image = PixabayDataModel.manager.getImage(withImageURL: imageURL) else {
            return
        }
        
        self.favoriteImageView.image = image
        self.layoutIfNeeded()
    }
    
    private func commonInit() {
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        self.contentView.addSubview(favoriteImageView)
        
        favoriteImageView.translatesAutoresizingMaskIntoConstraints = false
        
        favoriteImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
                favoriteImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
                favoriteImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        favoriteImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        
       let heightAnchor = favoriteImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 250)
        
        heightAnchor.priority = UILayoutPriority(rawValue: 999)
        
        heightAnchor.isActive = true
        
    }

}
