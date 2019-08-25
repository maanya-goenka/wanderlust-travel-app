//
//  ProfileViewController.swift
//  Wanderlust
//
//  Created by Mihikaa Goenka on 8/20/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController{
    
//    var nameTextField: UITextField!
//    var emailTextField: UITextField!
//    var interestsTextField: UITextField!
//    var pastDestinationsTextField: UITextField!
//    var profileImage: UIImageView!
//    var profile: Profile!
//    var dismissAndSaveButton: UIButton!
//
//    var placeholderTextName: String
//    var placeholderTextEmail: String
//    var placeholderTextInterests: String
//    var placeholderTextDestinations: String
//
//    init(placeholderTextName: String, placeholderTextEmail: String, placeholderTextInterests: String, placeholderTextDestinations: String) {
//        self.placeholderTextName = placeholderTextName
//        self.placeholderTextEmail = placeholderTextEmail
//        self.placeholderTextInterests = placeholderTextInterests
//        self.placeholderTextDestinations = placeholderTextDestinations
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        title = "My Profile"
//
////        let saveButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveButtonPressed))
////        self.navigationItem.rightBarButtonItem = saveButton
////
//
//        nameTextField = UITextField()
//        nameTextField.translatesAutoresizingMaskIntoConstraints = false
//        nameTextField.borderStyle = .roundedRect
//        nameTextField.text = placeholderTextName
//        nameTextField.clearsOnBeginEditing = true
//        nameTextField.backgroundColor = .red
//        nameTextField.textAlignment = .left
//        nameTextField.font = .systemFont(ofSize: 17)
//        view.addSubview(nameTextField)
//
//        emailTextField = UITextField()
//        emailTextField.translatesAutoresizingMaskIntoConstraints = false
//        emailTextField.borderStyle = .roundedRect
//        emailTextField.text = placeholderTextEmail
//        emailTextField.clearsOnBeginEditing = true
//        emailTextField.backgroundColor = .green
//        emailTextField.textAlignment = .left
//        emailTextField.font = .systemFont(ofSize: 17)
//        view.addSubview(emailTextField)
//
//        interestsTextField = UITextField()
//        interestsTextField.translatesAutoresizingMaskIntoConstraints = false
//        interestsTextField.borderStyle = .roundedRect
//        interestsTextField.text = placeholderTextInterests
//        interestsTextField.clearsOnBeginEditing = true
//        interestsTextField.backgroundColor = .blue
//        interestsTextField.textAlignment = .left
//        interestsTextField.font = .systemFont(ofSize: 17)
//        view.addSubview(interestsTextField)
//
//        pastDestinationsTextField = UITextField()
//        pastDestinationsTextField.translatesAutoresizingMaskIntoConstraints = false
//        pastDestinationsTextField.borderStyle = .roundedRect
//        pastDestinationsTextField.text = placeholderTextDestinations
//        pastDestinationsTextField.clearsOnBeginEditing = true
//        pastDestinationsTextField.backgroundColor = .magenta
//        pastDestinationsTextField.textAlignment = .left
//        pastDestinationsTextField.font = .systemFont(ofSize: 17)
//        view.addSubview(pastDestinationsTextField)
//
//        profileImage = UIImageView()
//        profileImage.image = UIImage(named: "profile")
//        profileImage.layer.cornerRadius = 15
//        profileImage.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(profileImage)
//
//        dismissAndSaveButton = UIButton()
//        dismissAndSaveButton.translatesAutoresizingMaskIntoConstraints = false
//        dismissAndSaveButton.setTitle("DISMISS AND SAVE", for: .normal)
//        dismissAndSaveButton.setTitleColor(.white, for: .normal)
//        dismissAndSaveButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//        dismissAndSaveButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
//        view.addSubview(dismissAndSaveButton)
//
//        setupConstraints()
//
    }
//    func setupConstraints(){
//
//        NSLayoutConstraint.activate([
//            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            profileImage.heightAnchor.constraint(equalToConstant: 170),
//            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            profileImage.widthAnchor.constraint(equalToConstant: 170)
//            ])
//
//        NSLayoutConstraint.activate([
//            nameTextField.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 30),
//            nameTextField.heightAnchor.constraint(equalToConstant: 40),
//            nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//            nameTextField.widthAnchor.constraint(equalToConstant: 300)
//            ])
//
//        NSLayoutConstraint.activate([
//            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
//            emailTextField.heightAnchor.constraint(equalToConstant: 40),
//            emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//            emailTextField.widthAnchor.constraint(equalToConstant: 300)
//         ])
//
//        NSLayoutConstraint.activate([
//            interestsTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
//            interestsTextField.heightAnchor.constraint(equalToConstant: 100),
//            interestsTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//            interestsTextField.widthAnchor.constraint(equalToConstant: 350)
//            ])
//
//        NSLayoutConstraint.activate([
//            pastDestinationsTextField.topAnchor.constraint(equalTo: interestsTextField.bottomAnchor, constant: 20),
//            pastDestinationsTextField.heightAnchor.constraint(equalToConstant: 100),
//            pastDestinationsTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//            pastDestinationsTextField.widthAnchor.constraint(equalToConstant: 350)
//            ])
//
//        NSLayoutConstraint.activate([
//            dismissAndSaveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            dismissAndSaveButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
//            ])
//
//    }
//    @objc func buttonPressed(){
//        let profileName = nameTextField.text
//        let profileEmail = emailTextField.text
//        let profileInterests = interestsTextField.text
//        let profileDestinations = pastDestinationsTextField.text
//        if let actualName = profileName, actualName != "" {
//            profile.profileName = actualName
//        }
//        if let actualEmail = profileEmail, actualEmail != "" {
//            profile.profileEmail = actualEmail
//        }
//        if let actualInterests = profileInterests, actualInterests != "" {
//            profile.profileInterests = actualInterests
//        }
//        if let actualDestinations = profileDestinations, actualDestinations != "" {
//            profile.profileDestinations = actualDestinations
//        }
//        //navigationController?.popViewController(animated: true)
//        dismiss(animated: true, completion: nil)
//    }

}
