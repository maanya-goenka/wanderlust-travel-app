//
//  PlaceCollectionViewCell.swift
//  Wanderlust
//
//  Created by Mihikaa Goenka on 8/8/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit

class PlaceCollectionViewCell: UICollectionViewCell {
    
    var title: UILabel!
    var address: UILabel!
    var picture: UIImageView!
    var heartIcon: UIButton!
    var locationIcon: UIImageView!
    
    weak var delegate: FavoriteDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.clipsToBounds = false
        contentView.layer.masksToBounds = false
        contentView.layer.cornerRadius = 20
        contentView.layer.backgroundColor = UIColor.white.cgColor
        contentView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        contentView.layer.shadowOpacity = 0.8
        contentView.layer.shadowRadius = 5
        contentView.layer.shadowOffset = CGSize(width: -5, height: 5)
        contentView.layer.shadowPath = UIBezierPath(roundedRect:(contentView.bounds), cornerRadius:20).cgPath
        
        title = UILabel()
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont(name: "AvenirNext-Medium", size: 15)
        contentView.addSubview(title)
        
        address = UILabel()
        address.textColor = .gray
        address.translatesAutoresizingMaskIntoConstraints = false
        address.font = UIFont(name: "AvenirNext-Medium", size: 14)
        contentView.addSubview(address)
        
        picture = UIImageView()
        picture.clipsToBounds = true
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.contentMode = .scaleAspectFill
        picture.layer.masksToBounds = true
        contentView.addSubview(picture)
        
        heartIcon = UIButton()
        heartIcon.setImage(UIImage(named: "heart_us_red"), for: .normal)
        heartIcon.translatesAutoresizingMaskIntoConstraints = false
        heartIcon.addTarget(self, action: #selector(changeHeart), for: .touchUpInside)
        contentView.addSubview(heartIcon)
        
        locationIcon = UIImageView(image: UIImage(named:"maps_us_black"))
        locationIcon.translatesAutoresizingMaskIntoConstraints = false
        locationIcon.tintColor = .gray
        locationIcon.contentMode = .scaleAspectFit
        contentView.addSubview(locationIcon)
        
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints(){
        
        
        NSLayoutConstraint.activate([
            heartIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            heartIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            heartIcon.widthAnchor.constraint(equalToConstant: 20),
            heartIcon.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            title.widthAnchor.constraint(equalToConstant: 250)
            ])
        
        NSLayoutConstraint.activate([
            locationIcon.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            locationIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            locationIcon.widthAnchor.constraint(equalToConstant: 20),
            locationIcon.heightAnchor.constraint(equalToConstant: 20)
            ])
        

        NSLayoutConstraint.activate([
            address.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            address.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor, constant: 5),
            address.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30)
            ])

        NSLayoutConstraint.activate([
            picture.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 10),
            picture.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            picture.widthAnchor.constraint(equalToConstant: contentView.frame.width-40),
            picture.heightAnchor.constraint(equalToConstant: 100)
            ])
    }
    
    func configure(for place: Place){
        title.text = place.placeTitle
        address.text = place.address
        picture.image = place.placeImage
        if place.isFavorite {
            print("Favorited")
            heartIcon.setImage(UIImage(named: "heart_s_red"), for: .normal)
        } else {
            heartIcon.setImage(UIImage(named: "heart_us_red"), for: .normal)
        }
    }
    
    @objc func changeHeart(){
        if heartIcon.image(for: .normal)==UIImage(named: "heart_s_red"){
            heartIcon.setImage(UIImage(named: "heart_us_red"), for: .normal)
        }
        else{
            heartIcon.setImage(UIImage(named: "heart_s_red"), for: .normal)
        }
        delegate?.favoritePressed(for: self)
    }
}
