//
//  InfoViewController.swift
//  Wanderlust
//
//  Created by Mihikaa Goenka on 8/19/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    var exitButton: UIButton!
    var aboutAppTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        exitButton = UIButton()
        exitButton.backgroundColor = UIColor(red: 1.0, green: 0.45, blue: 0.42, alpha: 1.0)
        exitButton.setTitle("X", for: .normal)
        exitButton.setTitleColor(.white, for: .normal)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.addTarget(self, action: #selector(leavePage), for: .touchUpInside)
        exitButton.layer.masksToBounds = false
        exitButton.layer.cornerRadius = 30
        exitButton.layer.borderWidth = 1
        exitButton.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        exitButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        exitButton.layer.shadowOpacity = 0.5
        exitButton.layer.shadowRadius = 3
        exitButton.layer.shadowOffset = CGSize(width: -3, height: 3)
        view.addSubview(exitButton)
        
        aboutAppTextView = UITextView()
        aboutAppTextView.backgroundColor = .clear
        aboutAppTextView.textColor = .lightGray
        aboutAppTextView.translatesAutoresizingMaskIntoConstraints = false
        aboutAppTextView.font = UIFont(name: "AppleSDGothicNeo-Light", size: 20)
        aboutAppTextView.isEditable = false
        aboutAppTextView.isScrollEnabled = false
        aboutAppTextView.textAlignment = .center
        aboutAppTextView.text = "Wanderlust is a centralized application which enables users to search various cities and decide which places they would like to visit while at their destination. It makes use of various advanced search options to help users fully utilise the database. It also enables businesses to add new places to visit. Users can also create a custom itinerary by favoriting places. We will eventually allow users to collaborate with friends and purchase tickets, etc. on this platform itself. \n\n\n\nHappy Travelling!"
        view.addSubview(aboutAppTextView)
        
        setUpConstraints()
    }
    
    func setUpConstraints(){
        
        NSLayoutConstraint.activate([
            exitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            exitButton.heightAnchor.constraint(equalToConstant: 60),
            exitButton.widthAnchor.constraint(equalToConstant: 60),
            exitButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            aboutAppTextView.topAnchor.constraint(equalTo: exitButton.bottomAnchor, constant: 40),
            aboutAppTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            aboutAppTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            aboutAppTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
            ])
        
    }
    
    @objc func leavePage(){
        dismiss(animated: true, completion: nil)
    }
    
}
