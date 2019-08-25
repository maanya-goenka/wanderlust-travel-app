//
//  CityCollectionViewCell.swift
//  Wanderlust
//
//  Created by Mihikaa Goenka on 8/6/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit

class CityCollectionViewCell: UICollectionViewCell {
    
    var cityNameLabel: UILabel!
    var cityImageView: UIImageView!
    var backgroundMaskView: UIView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        cityImageView = UIImageView(frame: .zero)
        cityImageView.translatesAutoresizingMaskIntoConstraints = false
        cityImageView.contentMode = .scaleToFill
        cityImageView.clipsToBounds = true
        cityImageView.layer.cornerRadius = 12
        contentView.addSubview(cityImageView)
        
        backgroundMaskView = UIView()
        backgroundMaskView.backgroundColor = UIColor(white: 0.0, alpha: 0.6)
        backgroundMaskView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(backgroundMaskView)
        
        cityNameLabel = UILabel()
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.font = UIFont(name: "AppleSDGothicNeo-Light", size: 30)
        cityNameLabel.textColor = .white
        cityNameLabel.textAlignment = .center
        contentView.addSubview(cityNameLabel)
        
        setUpConstraints()
    }
    
    func setUpConstraints(){
        
        NSLayoutConstraint.activate([
            cityImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cityImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cityImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cityImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            backgroundMaskView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundMaskView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundMaskView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
           backgroundMaskView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            cityNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cityNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
    }
    
    func configure(for city: City){
        cityNameLabel.text = city.name
        cityImageView.image = UIImage(named: city.cityimagestring)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
