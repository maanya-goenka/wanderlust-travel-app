//
//  LoginViewController.swift
//  Wanderlust
//
//  Created by Mihikaa Goenka on 8/6/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController{
    
    var appLogoView: UIImageView!
    var appLogo: UIImage!
    var appNameLabel: UILabel!
    var googleButton: UIButton!
    var facebookButton: UIButton!
    var line1: CGRect!
    var line1View: UIView!
    var line2: CGRect!
    var line2View: UIView!
    var orLabel: UILabel!
    var backgroundColor: UIColor!
    var grayColor: UIColor!
    var orangeColor: UIColor!
    var blackColor: UIColor!
    var signInButton: UIButton!
    var signUpButton: UIButton!
    var line: CGRect!
    var lineView: UIView!
    
    var sliderView: UIView!
    var loginView: LoginView!
    var signupView: SignupView!
    var currentView: UIView!
    
    var errorTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.contentMode = .scaleAspectFill
        backgroundColor = UIColor(red: 254/255, green: 250/255, blue: 252/255, alpha: 1)
        grayColor = UIColor(red: 247/255, green: 236/255, blue: 202/255, alpha: 1)
        orangeColor = UIColor(red: 166/255, green: 81/255, blue: 35/255, alpha: 100)
        blackColor = .black
        view.backgroundColor = backgroundColor
        navigationController?.navigationBar.barTintColor = grayColor
        navigationController?.navigationBar.barStyle = .blackOpaque
        
        line=CGRect(x: 0, y: 100, width: view.frame.width, height: 5)
        lineView = UIView(frame: line)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = orangeColor
        view.addSubview(lineView)
        
        line1=CGRect(x: 0, y: 100, width: view.frame.width, height: 5)
        line1View = UIView(frame: line1)
        line1View.translatesAutoresizingMaskIntoConstraints = false
        line1View.backgroundColor = grayColor
        view.addSubview(line1View)
        
        line2=CGRect(x: 0, y: 100, width: view.frame.width, height: 5)
        line2View = UIView(frame: line2)
        line2View.translatesAutoresizingMaskIntoConstraints = false
        line2View.backgroundColor = grayColor
        view.addSubview(line2View)
        
        // setup slider view for login / sign up bar
        sliderView = UIView()
        sliderView.translatesAutoresizingMaskIntoConstraints = false
        sliderView.backgroundColor = .black
        view.addSubview(sliderView)
        
        // setup login view
        loginView = LoginView(backgroundColor: backgroundColor, grayColor: grayColor, orangeColor: orangeColor)
        loginView.delegate = self
        currentView = loginView
        view.addSubview(loginView)
        loginSetupConstraints()
        
        // setup sign up view
        signupView = SignupView(backgroundColor: backgroundColor, grayColor: grayColor, orangeColor: orangeColor)
        signupView.isHidden = true
        signupView.delegate = self
        view.addSubview(signupView)
        signUpSetupConstraints()
        
        // setup logo image view
        appLogoView = UIImageView() // creates a new UIImageView instance
        appLogoView.translatesAutoresizingMaskIntoConstraints = false
        appLogoView.image = UIImage(named: "logo")
        appLogoView.clipsToBounds = true // image clipped to bounds of the receiver
        appLogoView.contentMode = .scaleAspectFit
        view.addSubview(appLogoView)
        
        // app name label
        appNameLabel = UILabel()
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        appNameLabel.text = "Wanderlust"
        appNameLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(appNameLabel)
        
        // or Label
        orLabel = UILabel()
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        orLabel.text = "or"
        orLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(orLabel)
        
        //setup google login view
        googleButton = UIButton()
        googleButton.translatesAutoresizingMaskIntoConstraints = false
        googleButton.setImage(UIImage(named: "googlelogin"), for: .normal)
        googleButton.layer.borderColor = blackColor.cgColor
        googleButton.layer.borderWidth = 0.05
        googleButton.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 8)
        googleButton.addTarget(self, action: #selector(googleButtonPressed), for: .touchUpInside)
        googleButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        googleButton.layer.shadowOpacity = 0.5
        googleButton.layer.shadowRadius = 3
        googleButton.layer.shadowOffset = CGSize(width: -3, height: 3)
        view.addSubview(googleButton)
        
        //setup facebook login view
        facebookButton = UIButton()
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
        facebookButton.setImage(UIImage(named: "facebooklogin"), for: .normal)
        facebookButton.layer.borderColor = blackColor.cgColor
        facebookButton.layer.borderWidth = 0.05
        facebookButton.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 8)
        //facebookButton.addTarget(self, action: #selector(facebookButtonPressed), for: .touchUpInside)
        facebookButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        facebookButton.layer.shadowOpacity = 0.5
        facebookButton.layer.shadowRadius = 3
        facebookButton.layer.shadowOffset = CGSize(width: -3, height: 3)
        view.addSubview(facebookButton)
        
        // sign in label
        signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false // always need for every view
        signInButton.setTitle("SIGN IN", for: .normal)
        signInButton.setTitleColor(.black, for: .normal)
        if currentView == loginView{
        signInButton.backgroundColor = orangeColor
        }
        signInButton.layer.cornerRadius = 5
        signInButton.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 18)
        signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        view.addSubview(signInButton)
        
        // sign up label
        signUpButton = UIButton()
        signUpButton.translatesAutoresizingMaskIntoConstraints = false // always need for every view
        signUpButton.setTitle("SIGN UP", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        if currentView == signupView{
            signUpButton.backgroundColor = orangeColor
        }
        signUpButton.layer.cornerRadius = 5
        signUpButton.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 18)
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        view.addSubview(signUpButton)
        setupConstraints()
    }

    @objc func googleButtonPressed(){
    }
    
    
    @objc func signInButtonPressed() {
        if (currentView != loginView) {
            signInButton.backgroundColor = orangeColor
            signUpButton.backgroundColor = backgroundColor
            signupView.isHidden = true
            loginView.isHidden = false
            currentView = loginView
        }
        UIView.animate(withDuration: 0.25) {
            self.sliderView.frame = CGRect(x: 0, y: self.sliderView.frame.minY, width: self.sliderView.frame.width, height: self.sliderView.frame.height)
        }
    }
    
    @objc func signUpButtonPressed() {
        if (currentView != signupView) {
            signInButton.backgroundColor = backgroundColor
            signUpButton.backgroundColor = orangeColor
            loginView.isHidden = true
            signupView.isHidden = false
            currentView = signupView
        }
        UIView.animate(withDuration: 0.2) {
            self.sliderView.frame = CGRect(x: self.view.frame.width / 2, y: self.sliderView.frame.minY, width: self.sliderView.frame.width, height: self.sliderView.frame.height)
        }
    }
    
    func setupConstraints() {
        // Setup constraints for image view
        NSLayoutConstraint.activate([
            appLogoView.heightAnchor.constraint(equalToConstant: 100),
            appLogoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            appLogoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            appLogoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 25),
            ])
        
        // Setup constraints for app name
        NSLayoutConstraint.activate([
            appNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appNameLabel.topAnchor.constraint(equalTo: appLogoView.bottomAnchor,constant: 10)
            ])
        
        NSLayoutConstraint.activate([
            googleButton.heightAnchor.constraint(equalToConstant: 30),
            googleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            googleButton.widthAnchor.constraint(equalToConstant: 170),
            googleButton.topAnchor.constraint(equalTo: appNameLabel.topAnchor, constant: 80)
            ])
        
        NSLayoutConstraint.activate([
            facebookButton.heightAnchor.constraint(equalToConstant: 30),
            facebookButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            facebookButton.widthAnchor.constraint(equalToConstant: 170),
            facebookButton.topAnchor.constraint(equalTo: appNameLabel.topAnchor, constant: 80)
            ])
        
        NSLayoutConstraint.activate([
            line1View.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            line1View.widthAnchor.constraint(equalToConstant: 150),
            line1View.topAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: 50),
            line1View.heightAnchor.constraint(equalToConstant: 1)
            ])
        
        NSLayoutConstraint.activate([
            line2View.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            line2View.widthAnchor.constraint(equalToConstant: 150),
            line2View.topAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: 50),
            line2View.heightAnchor.constraint(equalToConstant: 1)
            ])
        
        NSLayoutConstraint.activate([
            orLabel.centerYAnchor.constraint(equalTo: googleButton.bottomAnchor, constant: 50),
            orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
        // Setup constraints for sign in button
        NSLayoutConstraint.activate([
            signInButton.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            signInButton.topAnchor.constraint(equalTo: appLogoView.bottomAnchor,constant: 210)
            ])
        
        // Setup constraints for sign up button
        NSLayoutConstraint.activate([
            signUpButton.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            signUpButton.topAnchor.constraint(equalTo: appLogoView.bottomAnchor,constant: 210),
            ])
        
        // setup constraints for slider bar
        NSLayoutConstraint.activate([
            sliderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sliderView.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            sliderView.heightAnchor.constraint(equalToConstant: 2),
            sliderView.bottomAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 5)
            ])
        
        // setup constraints for horizontal line
        NSLayoutConstraint.activate([
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lineView.topAnchor.constraint(equalTo: sliderView.bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1)
            ])
    }
    
    func loginSetupConstraints () {
        // setup login constraints
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginView.topAnchor.constraint(equalTo: lineView.topAnchor, constant: 10),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    func signUpSetupConstraints () {
        // setup sign up constraints
        NSLayoutConstraint.activate([
            signupView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            signupView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            signupView.topAnchor.constraint(equalTo: lineView.topAnchor, constant: 10),
            signupView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}

extension LoginViewController: LoginViewDelegate {
    func validateData(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
           
            if let error = error {
                self.setUpSignUpErrorMessage(error: error.localizedDescription)
                return
            }
            let vc = HomeViewController() as! UIViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func setUpLoginErrorMessage(error: String){
        self.errorTextView.backgroundColor = .clear
        self.errorTextView.text = error
        self.errorTextView.textColor = .red
        self.errorTextView.translatesAutoresizingMaskIntoConstraints = false
        self.errorTextView.isEditable = true
        self.errorTextView.isScrollEnabled = false
        self.errorTextView.textAlignment = .center
        self.errorTextView.font = UIFont(name: "Montserrat-Bold", size: 12)
        view.addSubview(self.errorTextView)
        
        NSLayoutConstraint.activate([
            self.errorTextView.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: -70),
            self.errorTextView.heightAnchor.constraint(equalToConstant: 60),
            self.errorTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            self.errorTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ])
    }
}

extension LoginViewController: SignUpViewDelegate {
    func signUpData(email: String, name: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                self.setUpSignUpErrorMessage(error: error.localizedDescription)
                return
            }
            guard let uid = result?.user.uid else {return}
            let values = ["email": email, "name": name]
            Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: {(error, ref) in
                if let error = error {
                    print("Failed to update database values with error", error.localizedDescription)
                    return
                }
                let vc = HomeViewController() as! UIViewController
                self.navigationController?.pushViewController(vc, animated: true)
            })
        }
    }
    
    func setUpSignUpErrorMessage(error: String){
        self.errorTextView.backgroundColor = .clear
        self.errorTextView.text = error
        self.errorTextView.textColor = .red
        self.errorTextView.translatesAutoresizingMaskIntoConstraints = false
        self.errorTextView.isEditable = true
        self.errorTextView.isScrollEnabled = false
        self.errorTextView.textAlignment = .center
        self.errorTextView.font = UIFont(name: "Montserrat-Bold", size: 12)
        view.addSubview(self.errorTextView)
        
        NSLayoutConstraint.activate([
            self.errorTextView.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: -50),
            self.errorTextView.heightAnchor.constraint(equalToConstant: 40),
            self.errorTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            self.errorTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ])
    }
}


