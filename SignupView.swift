//
//  SignupView.swift
//  Wanderlust
//
//  Created by Mihikaa Goenka on 8/6/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit

protocol SignUpViewDelegate: class  {
    func signUpData(email: String, name: String, password: String)
}

class SignupView: UIView {
    
    var emailTextField : UITextField!
    var emailLabel : UILabel!
    var emailLineView: UIView!
    var usernameLabel: UILabel!
    var usernameTextField: UITextField!
    var usernameLineView: UIView!
    var passwordLabel: UILabel!
    var passwordTextField: UITextField!
    var passwordLineView: UIView!
    var createAccountButton: UIButton!
    var loginAsGuestButton: UIButton!
    weak var delegate: SignUpViewDelegate?
    
    var buffer: CGFloat!
    var distFromTop: CGFloat!
    var buttonHeight: CGFloat!
    
    init(backgroundColor: UIColor, grayColor: UIColor, orangeColor: UIColor) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
        buffer = 50
        distFromTop = 15
        buttonHeight = 60
        
        // label for email
        emailLabel = UILabel()
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "Email"
        emailLabel.font = UIFont(name: "Montserrat-Regular", size: 16)
        emailLabel.textColor = orangeColor
        self.addSubview(emailLabel)
        
        // email text field
        emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.backgroundColor = backgroundColor
        emailTextField.borderStyle = .none
        emailTextField.clipsToBounds = true
        emailTextField.textColor = .black
        self.addSubview(emailTextField)
        
        // email line
        emailLineView = UIView()
        emailLineView.translatesAutoresizingMaskIntoConstraints = false
        emailLineView.backgroundColor = orangeColor
        self.addSubview(emailLineView)
        
        // label for name
        usernameLabel = UILabel()
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.text = "Name"
        usernameLabel.font = UIFont(name: "Montserrat-Regular", size: 16)
        usernameLabel.textColor = orangeColor
        self.addSubview(usernameLabel)
        
        // username text field
        usernameTextField = UITextField()
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.backgroundColor = backgroundColor
        usernameTextField.borderStyle = .none
        usernameTextField.clipsToBounds = true
        usernameTextField.textColor = .black
        self.addSubview(usernameTextField)
        
        // username line
        usernameLineView = UIView()
        usernameLineView.translatesAutoresizingMaskIntoConstraints = false
        usernameLineView.backgroundColor = orangeColor
        self.addSubview(usernameLineView)
        
        // label for password
        passwordLabel = UILabel()
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont(name: "Montserrat-Regular", size: 16)
        passwordLabel.textColor = orangeColor
        self.addSubview(passwordLabel)
        
        // password text field
        passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.backgroundColor = backgroundColor
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .none
        passwordTextField.clipsToBounds = true
        passwordTextField.textColor = .black
        self.addSubview(passwordTextField)
        
        // password line
        passwordLineView = UIView()
        passwordLineView.translatesAutoresizingMaskIntoConstraints = false
        passwordLineView.backgroundColor = orangeColor
        self.addSubview(passwordLineView)
        
        
        // create account button
        createAccountButton = UIButton()
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.setTitle("Create Account", for: .normal)
        createAccountButton.backgroundColor = orangeColor
        createAccountButton.setTitleColor(.black, for: .normal)
        createAccountButton.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 18)
        createAccountButton.addTarget(self, action: #selector(createAccountButtonPressed), for: .touchUpInside)
        createAccountButton.layer.cornerRadius = 8
        self.addSubview(createAccountButton)
        
        
        setupConstraints()
    }
    
    @objc func createAccountButtonPressed () {
        print("pressed create account button")
        if let email = emailTextField.text, let password = passwordTextField.text, let name = usernameTextField.text {
            delegate?.signUpData(email: email, name: name, password: password)
        }
        else {
            print("in else statement")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        // constraints for email label
        NSLayoutConstraint.activate([
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.buffer),
            emailLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.distFromTop)
            ])
        // constraints for email text field
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.buffer),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: (-self.buffer)),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5)
            ])
        // constraints for email line
        NSLayoutConstraint.activate([
            emailLineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.buffer),
            emailLineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: (-self.buffer)),
            emailLineView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            emailLineView.heightAnchor.constraint(equalToConstant: 2)
            ])
        // constraints for username label
        NSLayoutConstraint.activate([
            usernameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.buffer),
            usernameLabel.topAnchor.constraint(equalTo: emailLineView.bottomAnchor, constant: 20)
            ])
        // constraints for username text field
        NSLayoutConstraint.activate([
            usernameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.buffer),
            usernameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: (-self.buffer)),
            usernameTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5)
            ])
        // constraints for username line
        NSLayoutConstraint.activate([
            usernameLineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.buffer),
            usernameLineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: (-self.buffer)),
            usernameLineView.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 15),
            usernameLineView.heightAnchor.constraint(equalToConstant: 2)
            ])
        // constraints for password label
        NSLayoutConstraint.activate([
            passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.buffer),
            passwordLabel.topAnchor.constraint(equalTo: usernameLineView.bottomAnchor, constant: 20)
            ])
        
        // constraints for password text field
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.buffer),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: (-self.buffer)),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5)
            ])
        // constraints for password line
        NSLayoutConstraint.activate([
            passwordLineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.buffer),
            passwordLineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: (-self.buffer)),
            passwordLineView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            passwordLineView.heightAnchor.constraint(equalToConstant: 2)
            ])
        // create account button
        NSLayoutConstraint.activate([
            createAccountButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: buffer),
            createAccountButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -buffer),
            createAccountButton.topAnchor.constraint(equalTo: passwordLineView.bottomAnchor, constant: 35),
            createAccountButton.heightAnchor.constraint(equalToConstant: buttonHeight)
            ])
        
    }
}
