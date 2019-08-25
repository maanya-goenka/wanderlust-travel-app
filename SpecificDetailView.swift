//
//  SpecificDetailView.swift
//  Wanderlust
//
//  Created by Mihikaa Goenka on 8/10/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit

class SpecificDetailView: UIViewController {
    
    var placeTitleView: UITextField!
    var placeAddressView: UITextView!
    var placeDescriptionView: UITextView!
    var pictureView: UIImageView!
    var locationIcon: UIImageView!
    
    var placeTitle: String
    var placeLocation: String
    var placeType: Choice
    var address: String
    var placeDescription: String
    var placeImage: UIImage!
    
    init(placeTitle: String, placeLocation: String, placeType: Choice, placeDescription: String, placeImage: UIImage, address: String) {
        self.placeTitle = placeTitle
        self.placeType = placeType
        self.placeLocation = placeLocation
        self.placeDescription = placeDescription
        self.placeImage = placeImage
        self.address = address
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "About"
        
        placeTitleView = UITextField()
        placeTitleView.layer.cornerRadius = 12
        placeTitleView.translatesAutoresizingMaskIntoConstraints = false
        placeTitleView.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        placeTitleView.textColor = .black
        placeTitleView.textAlignment = .center
        placeTitleView.text =  String(describing: placeType).localizedUppercase + ":  " + placeTitle
        placeTitleView.sizeToFit()
        placeTitleView.font = UIFont(name: "AvenirNext-Medium", size: 20)
        view.addSubview(placeTitleView)
        
        placeAddressView = UITextView()
        placeAddressView.backgroundColor = .white
        placeAddressView.textColor = .gray
        placeAddressView.layer.cornerRadius = 12
        placeAddressView.translatesAutoresizingMaskIntoConstraints = false
        placeAddressView.text = address + ", " + placeLocation
        placeAddressView.isEditable = false
        placeAddressView.isScrollEnabled = true
        placeAddressView.sizeToFit()
        placeAddressView.font = UIFont(name: "AvenirNext-Regular", size: 17)
        view.addSubview(placeAddressView)
        
        placeDescriptionView = UITextView()
        placeDescriptionView.backgroundColor = .white
        placeDescriptionView.layer.cornerRadius = 12
        placeDescriptionView.textColor = .gray
        placeDescriptionView.translatesAutoresizingMaskIntoConstraints = false
        placeDescriptionView.text = placeDescription
        placeDescriptionView.isEditable = false
        placeDescriptionView.isScrollEnabled = false
        placeDescriptionView.sizeToFit()
        placeDescriptionView.font = UIFont(name: "AvenirNext-Regular", size: 17)
        view.addSubview(placeDescriptionView)
        
        pictureView = UIImageView()
        pictureView.image = placeImage
        pictureView.backgroundColor = .white
        pictureView.layer.cornerRadius = 15
        pictureView.translatesAutoresizingMaskIntoConstraints = false
        pictureView.clipsToBounds = true
        pictureView.layer.cornerRadius = 12
        pictureView.contentMode = .scaleAspectFit
        view.addSubview(pictureView)
        
        locationIcon = UIImageView(image: UIImage(named:"maps_us_black"))
        locationIcon.tintColor = .gray
        locationIcon.translatesAutoresizingMaskIntoConstraints = false
        locationIcon.contentMode = .scaleAspectFit
        view.addSubview(locationIcon)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            placeTitleView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -310),
            placeTitleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            placeTitleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            placeTitleView.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        NSLayoutConstraint.activate([
            locationIcon.topAnchor.constraint(equalTo: placeTitleView.bottomAnchor, constant: 25),
            locationIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            locationIcon.heightAnchor.constraint(equalToConstant: 25),
            locationIcon.widthAnchor.constraint(equalToConstant: 23)
            ])
        
        NSLayoutConstraint.activate([
            placeAddressView.topAnchor.constraint(equalTo: placeTitleView.bottomAnchor, constant: 25),
            placeAddressView.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor, constant: 5),
            placeAddressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            placeAddressView.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        NSLayoutConstraint.activate([
            placeDescriptionView.topAnchor.constraint(equalTo: locationIcon.bottomAnchor, constant: 40),
            placeDescriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            placeDescriptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        
        NSLayoutConstraint.activate([
            pictureView.topAnchor.constraint(equalTo: placeDescriptionView.bottomAnchor, constant: 16),
            pictureView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pictureView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pictureView.heightAnchor.constraint(equalToConstant: 300)
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
