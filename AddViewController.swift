//
//  AddViewController.swift
//  Wanderlust
//
//  Created by Mihikaa Goenka on 8/8/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate{
    
    
    var scrollView: UIScrollView!
    
    var placeTitleLabel : UILabel!
    var placeLocationLabel: UILabel!
    var placeTypeLabel: UILabel!
    var addressLabel: UILabel!
    var placeDescriptionLabel: UILabel!
    var uploadImageButton: UIButton!
    var tagsLabel: UILabel!
    var placeTitleTextField: UITextField!
    var placeLocationTextField: UITextField!
    var placeTypeTextField: UITextField!
    var addressTextField: UITextField!
    var placeDescriptionTextView: UITextView!
    var placeImageView: UIImageView!
    var clickImageButton: UIButton!
    var photoPicker: UIImagePickerController!
    var postButton: UIButton!
    weak var delegate: AddPlaceDelegate?
    
    
    var picker = UIPickerView()
    var data = ["Hotel", "Club", "Restaurant", "Site"]
    
    let textFieldHeight: CGFloat = 30
    let textFieldWidth: CGFloat = 370
    //weak var delegate: AddToListDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add New Destination"
        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .cyan
        
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints =  false
        scrollView.backgroundColor = .white
        scrollView.contentSize.height = view.bounds.height + 400
        view.addSubview(scrollView)
        
        placeTitleLabel = UILabel()
        placeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        placeTitleLabel.text = "Title of Place"
        placeTitleLabel.textColor = .cyan
        placeTitleLabel.font = UIFont(name: "AvenirNext-Regular", size: 18)
        scrollView.addSubview(placeTitleLabel)
        
        placeTitleTextField = UITextField()
        placeTitleTextField.placeholder = " Short, one-line title"
        placeTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        placeTitleTextField.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        placeTitleTextField.font = UIFont(name: "AvenirNext-Regular", size: 17)
        placeTitleTextField.borderStyle = .none
        placeTitleTextField.textColor = .black
        placeTitleTextField.layer.cornerRadius = 5
        placeTitleTextField.clearButtonMode = .always
        scrollView.addSubview(placeTitleTextField)
        
        placeTypeLabel = UILabel()
        placeTypeLabel.text = "Pick a Category"
        placeTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        placeTypeLabel.textColor = .cyan
        placeTypeLabel.font = UIFont(name: "AvenirNext-Regular", size: 18)
        scrollView.addSubview(placeTypeLabel)
        
        placeTypeTextField = UITextField()
        placeTypeTextField.placeholder = "Enter Type Of Place Here"
        placeTypeTextField.translatesAutoresizingMaskIntoConstraints = false
        placeTypeTextField.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        placeTypeTextField.font = UIFont(name: "AvenirNext-Regular", size: 17)
        placeTypeTextField.borderStyle = .none
        placeTypeTextField.textColor = .black
        placeTypeTextField.layer.cornerRadius = 5
        placeTypeTextField.clearButtonMode = .always
        scrollView.addSubview(placeTypeTextField)
        
        placeLocationLabel = UILabel()
        placeLocationLabel.text = "Enter Name of City"
        placeLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        placeLocationLabel.textColor = .cyan
        placeLocationLabel.font = UIFont(name: "AvenirNext-Regular", size: 18)
        scrollView.addSubview(placeLocationLabel)
        
        placeLocationTextField = UITextField()
        placeLocationTextField.placeholder = " Enter City Here"
        placeLocationTextField.translatesAutoresizingMaskIntoConstraints = false
        placeLocationTextField.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        placeLocationTextField.font = UIFont(name: "AvenirNext-Regular", size: 17)
        placeLocationTextField.borderStyle = .none
        placeLocationTextField.textColor = .black
        placeLocationTextField.layer.cornerRadius = 5
        placeLocationTextField.clearButtonMode = .always
        scrollView.addSubview(placeLocationTextField)
        
        addressLabel = UILabel()
        addressLabel.text = "Address of Place"
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.textColor = .cyan
        addressLabel.font = UIFont(name: "AvenirNext-Regular", size: 18)
        scrollView.addSubview(addressLabel)
        
        addressTextField = UITextField()
        addressTextField.placeholder = "Enter address (limit to one sentence)"
        addressTextField.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        addressTextField.translatesAutoresizingMaskIntoConstraints = false
        addressTextField.font = UIFont(name: "AvenirNext-Regular", size: 17)
        addressTextField.borderStyle = .none
        addressTextField.textColor = .black
        addressTextField.layer.cornerRadius = 5
        addressTextField.clearButtonMode = .always
        scrollView.addSubview(addressTextField)
        
        placeDescriptionLabel = UILabel()
        placeDescriptionLabel.text = "Description of Place"
        placeDescriptionLabel.textColor = .cyan
        placeDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        placeDescriptionLabel.font = UIFont(name: "AvenirNext-Regular", size: 18)
        scrollView.addSubview(placeDescriptionLabel)
        
        placeDescriptionTextView = UITextView()
        placeDescriptionTextView.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        placeDescriptionTextView.font = UIFont(name: "AvenirNext-Regular", size: 17)
        placeDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        placeDescriptionTextView.isEditable = true
        placeDescriptionTextView.textColor = .black
        placeDescriptionTextView.layer.cornerRadius = 5
        scrollView.addSubview(placeDescriptionTextView)
        
        uploadImageButton = UIButton()
        uploadImageButton.setTitle("Click to Upload Image", for: .normal)
        uploadImageButton.translatesAutoresizingMaskIntoConstraints = false
        uploadImageButton.setTitleColor(.cyan, for: .normal)
        uploadImageButton.titleLabel?.font =  UIFont(name: "AvenirNext-Medium", size: 18)
        uploadImageButton.titleLabel?.textAlignment = .center
        uploadImageButton.addTarget(self, action: #selector(upload), for: .touchUpInside)
        scrollView.addSubview(uploadImageButton)
        
        postButton = UIButton()
        postButton.setTitle("SAVE AND POST", for: .normal)
        postButton.setTitleColor(UIColor(red:1, green:0.45, blue:0.42, alpha:1.0), for: .normal)
        postButton.titleLabel?.font =  UIFont(name: "AvenirNext-Medium", size: 18)
        postButton.backgroundColor = .white
        postButton.translatesAutoresizingMaskIntoConstraints = false
        postButton.addTarget(self, action: #selector(post), for: .touchUpInside)
        postButton.layer.masksToBounds = false
        postButton.layer.cornerRadius = 20
        postButton.layer.borderWidth = 2
        postButton.layer.borderColor = UIColor(red:1, green:0.45, blue:0.42, alpha:1.0).cgColor
        scrollView.addSubview(postButton)
        
        clickImageButton = UIButton()
        clickImageButton.setTitle("Click to take Photo", for: .normal)
        clickImageButton.translatesAutoresizingMaskIntoConstraints = false
        clickImageButton.setTitleColor(UIColor(red:1, green:0.45, blue:0.42, alpha:1.0), for: .normal)
        clickImageButton.titleLabel?.font =  UIFont(name: "AvenirNext-Medium", size: 18)
        clickImageButton.addTarget(self, action: #selector(click), for: .touchUpInside)
        clickImageButton.titleLabel?.textAlignment = .left
        scrollView.addSubview(clickImageButton)
        
        placeImageView = UIImageView()
        placeImageView.translatesAutoresizingMaskIntoConstraints = false
        placeImageView.image = UIImage(named: "upload")
        placeImageView.contentMode = .scaleToFill
        placeImageView.backgroundColor = .white
        placeImageView.layer.cornerRadius = 10
        placeImageView.contentMode = .scaleAspectFit
        scrollView.addSubview(placeImageView)

        picker.dataSource = self
        picker.delegate = self
        picker.translatesAutoresizingMaskIntoConstraints = false
        placeTypeTextField.inputView = picker
        
        setUpConstraints()
    }
    
    func setUpConstraints(){
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            placeTitleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            placeTitleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            placeTitleLabel.widthAnchor.constraint(equalToConstant: 250)
            ])
        
        NSLayoutConstraint.activate([
            placeTitleTextField.topAnchor.constraint(equalTo: placeTitleLabel.bottomAnchor, constant: 3),
            placeTitleTextField.heightAnchor.constraint(equalToConstant: textFieldHeight),
            placeTitleTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            placeTitleTextField.widthAnchor.constraint(equalToConstant: textFieldWidth)
            ])
        
        NSLayoutConstraint.activate([
            placeTypeLabel.topAnchor.constraint(equalTo: placeTitleTextField.bottomAnchor, constant: 20),
            placeTypeLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            placeTypeLabel.widthAnchor.constraint(equalToConstant: 250)
            ])
        
        NSLayoutConstraint.activate([
            placeTypeTextField.topAnchor.constraint(equalTo: placeTypeLabel.bottomAnchor, constant: 3),
            placeTypeTextField.heightAnchor.constraint(equalToConstant: textFieldHeight),
            placeTypeTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            placeTypeTextField.widthAnchor.constraint(equalToConstant: textFieldWidth)
            ])
        
        NSLayoutConstraint.activate([
            placeLocationLabel.topAnchor.constraint(equalTo: placeTypeTextField.bottomAnchor, constant: 20),
            placeLocationLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            placeLocationLabel.widthAnchor.constraint(equalToConstant: 250)
            ])
        
        NSLayoutConstraint.activate([
            placeLocationTextField.topAnchor.constraint(equalTo: placeLocationLabel.bottomAnchor, constant: 3),
            placeLocationTextField.heightAnchor.constraint(equalToConstant: textFieldHeight),
            placeLocationTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            placeLocationTextField.widthAnchor.constraint(equalToConstant: textFieldWidth)
            ])
        
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: placeLocationTextField.bottomAnchor, constant: 20),
            addressLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            addressLabel.widthAnchor.constraint(equalToConstant: 250)
            ])
        
        NSLayoutConstraint.activate([
            addressTextField.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 3),
            addressTextField.heightAnchor.constraint(equalToConstant: textFieldHeight),
            addressTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            addressTextField.widthAnchor.constraint(equalToConstant: textFieldWidth)
            ])
        
        NSLayoutConstraint.activate([
            placeDescriptionLabel.topAnchor.constraint(equalTo: addressTextField.bottomAnchor, constant: 20),
            placeDescriptionLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            placeDescriptionLabel.widthAnchor.constraint(equalToConstant: 250)
            ])
        
        NSLayoutConstraint.activate([
            placeDescriptionTextView.topAnchor.constraint(equalTo: placeDescriptionLabel.bottomAnchor, constant: 3),
            placeDescriptionTextView.heightAnchor.constraint(equalToConstant: 150),
            placeDescriptionTextView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            placeDescriptionTextView.widthAnchor.constraint(equalToConstant: textFieldWidth)
            ])
        
        NSLayoutConstraint.activate([
            uploadImageButton.topAnchor.constraint(equalTo: placeDescriptionTextView.bottomAnchor, constant: 20),
            uploadImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uploadImageButton.widthAnchor.constraint(equalToConstant: 250)
            ])
        
        NSLayoutConstraint.activate([
            placeImageView.topAnchor.constraint(equalTo: uploadImageButton.bottomAnchor, constant: 5),
            placeImageView.heightAnchor.constraint(equalToConstant: 250),
            placeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            placeImageView.widthAnchor.constraint(equalToConstant: 250)
            ])
        
        NSLayoutConstraint.activate([
            clickImageButton.topAnchor.constraint(equalTo: placeImageView.bottomAnchor, constant: 5),
            clickImageButton.heightAnchor.constraint(equalToConstant: 40),
            clickImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            clickImageButton.widthAnchor.constraint(equalToConstant: 250)
            ])
        
        NSLayoutConstraint.activate([
            postButton.topAnchor.constraint(equalTo: clickImageButton.bottomAnchor, constant: 25),
            postButton.heightAnchor.constraint(equalToConstant: 30),
            postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postButton.widthAnchor.constraint(equalToConstant: 200)
            ])

    }
    
    func makeAlert() {
        let alert = UIAlertController(title: "Post Cannot Be Added:", message: "Please fill out all areas", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alert, animated: true, completion: nil)
    }
    
    func maxTitleCharacterAlert() {
        let alert = UIAlertController(title: "Post Cannot Be Added:", message: "Your title is over 30 characters", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alert, animated: true, completion: nil)
    }
    
    func maxAddressCharacterAlert() {
        let alert = UIAlertController(title: "Post Cannot Be Added:", message: "Your address is over 40 characters", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alert, animated: true, completion: nil)
    }
    
    func cityNameAlert(){
        let alert = UIAlertController(title: "Incorrect Input", message: "You are adding to the wrong city", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func upload() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            photoPicker = UIImagePickerController()
            photoPicker.delegate = self
            photoPicker.sourceType = .photoLibrary
            photoPicker.allowsEditing = true
            present(photoPicker, animated: true, completion: nil)
        } else {
            print ("unable to access photo library")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let photo = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            placeImageView.image = photo
        }
        dismiss(animated: true, completion: nil)
    }
    
    @objc func click(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            photoPicker = UIImagePickerController()
            photoPicker.sourceType = .camera
            photoPicker.delegate = self
            photoPicker.allowsEditing = true
            present(photoPicker, animated: true, completion: nil)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @objc func post(){
        if let title = placeTitleTextField.text, let location = placeLocationTextField.text, let address = addressTextField.text, let type = placeTypeTextField.text, let description = placeDescriptionTextView.text {
            if title == "" || location == "" || address == "" || type == "" || description == "" {
                makeAlert()
            } else if title.count > 30 {
                maxTitleCharacterAlert()
            } else if address.count > 40 {
                maxAddressCharacterAlert()
            } else {
                if placeImageView.image == UIImage(named: "upload") {
                    delegate?.addNewPlace(to: title, to: location, to: address, to: type, to: description, to: nil)
                    //print("No Image")
                } else {
                    delegate?.addNewPlace(to: title, to: location, to: address, to: type, to: description, to: placeImageView.image!)
                    //print("All dome")
                }
            }
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    //PickerView delegates and dataSource functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        placeTypeTextField.text = data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
}
