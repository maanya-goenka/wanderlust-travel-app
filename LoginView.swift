//
//  LoginView.swift
//  Wanderlust
//
//  Created by Mihikaa Goenka on 8/6/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit

protocol LoginViewDelegate: class  {
    func validateData(email: String, password: String)
}

class LoginView: UIView {
    
    var emailTextField : UITextField!
    var emailLabel : UILabel!
    var lineView1: UIView!
    var passwordLabel: UILabel!
    var passwordTextField: UITextField!
    var lineView2: UIView!
    var forgotPasswordButton: UIButton!
    var view: UIView!
    var loginButton: UIButton!
    var loginWithFacebookButton: UIButton!
    var facebookLogoView: UIImageView!
    var loginWithGoogleButton: UIButton!
    var googleLogoView: UIImageView!
    var blackColor: UIColor!
    weak var delegate: LoginViewDelegate?
    
    var buffer: CGFloat!
    var distFromTop: CGFloat!
    var buttonHeight: CGFloat!
    
    init(backgroundColor: UIColor, grayColor: UIColor, orangeColor: UIColor) {
        super.init(frame: .zero)
        self.backgroundColor = blackColor
        self.translatesAutoresizingMaskIntoConstraints = false
        buffer = 50
        distFromTop = 15
        buttonHeight = 50
        blackColor = .black
        
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
        lineView1 = UIView()
        lineView1.translatesAutoresizingMaskIntoConstraints = false
        lineView1.backgroundColor = orangeColor
        self.addSubview(lineView1)
        
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
        passwordTextField.borderStyle = .none
        passwordTextField.clipsToBounds = true
        passwordTextField.textColor = .black
        passwordTextField.isSecureTextEntry = true
        self.addSubview(passwordTextField)
        
        // password line
        lineView2 = UIView()
        lineView2.translatesAutoresizingMaskIntoConstraints = false
        lineView2.backgroundColor = orangeColor
        self.addSubview(lineView2)
        
        // forgot password button
        forgotPasswordButton = UIButton()
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.setAttributedTitle(NSAttributedString(string: "Forgot Password?", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.foregroundColor : blackColor]), for: .normal)
        forgotPasswordButton.titleLabel?.font = UIFont(name: "Montserrat-Light", size: 16)
        forgotPasswordButton.setTitleColor(blackColor, for: .normal)
        forgotPasswordButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        self.addSubview(forgotPasswordButton)
        
        // login button
        loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = orangeColor
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 18)
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        loginButton.layer.cornerRadius = 8
        self.addSubview(loginButton)
        
        
        
        setupConstraints()
    }
    
    @objc func loginButtonPressed () {
        if let email = emailTextField.text, let password = passwordTextField.text {
            delegate?.validateData(email: email, password: password)
        }
        else {
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        // constraints for username label
        NSLayoutConstraint.activate([
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.buffer),
            emailLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.distFromTop)
            ])
        // constraints for username text field
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.buffer),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: (-self.buffer)),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5)
            ])
        // constraints for username line
        NSLayoutConstraint.activate([
            lineView1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.buffer),
            lineView1.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: (-self.buffer)),
            lineView1.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            lineView1.heightAnchor.constraint(equalToConstant: 2)
            ])
        // constraints for password label
        NSLayoutConstraint.activate([
            passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.buffer),
            passwordLabel.topAnchor.constraint(equalTo: lineView1.bottomAnchor, constant: 20)
            ])
        // constraints for password text field
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.buffer),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: (-self.buffer)),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5)
            ])
        // constraints for password line
        NSLayoutConstraint.activate([
            lineView2.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.buffer),
            lineView2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: (-self.buffer)),
            lineView2.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            lineView2.heightAnchor.constraint(equalToConstant: 2)
            ])
        // forgot password button
        NSLayoutConstraint.activate([
            forgotPasswordButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            forgotPasswordButton.topAnchor.constraint(equalTo: lineView2.bottomAnchor, constant: 30)
            ])
        // login button
        NSLayoutConstraint.activate([
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: buffer),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -buffer),
            loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 15),
            loginButton.heightAnchor.constraint(equalToConstant: buttonHeight)
            ])
        
    }
}
