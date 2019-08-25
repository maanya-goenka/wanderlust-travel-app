//
//  ViewController.swift
//  Wanderlust
//
//  Created by Mihikaa Goenka on 8/3/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var wanderlustLabel: UILabel!
    var textView: UITextView!
    var images = ["travel", "party", "trees"]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    var button: UIButton!
    var infoButton: UIButton!
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.currentPageIndicatorTintColor = .darkGray
        pc.pageIndicatorTintColor = .lightGray
        pc.backgroundColor = .clear
        pc.numberOfPages = images.count
        return pc
    }()
    
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: (view.frame.height)-CGFloat(300.0)))
        sv.isPagingEnabled = true
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor(white: 1, alpha: 0.9)
        navigationController?.navigationBar.barTintColor = UIColor(white: 1, alpha: 0.9)
        
        infoButton = UIButton()
        infoButton.backgroundColor = UIColor(red: 1.0, green: 0.45, blue: 0.42, alpha: 1.0)
        infoButton.setTitle("i", for: .normal)
        infoButton.setTitleColor(.white, for: .normal)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        infoButton.addTarget(self, action: #selector(getInfo), for: .touchUpInside)
        infoButton.layer.masksToBounds = false
        infoButton.layer.cornerRadius = 30
        infoButton.layer.borderWidth = 1
        infoButton.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        infoButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        infoButton.layer.shadowOpacity = 0.5
        infoButton.layer.shadowRadius = 3
        infoButton.layer.shadowOffset = CGSize(width: -3, height: 3)
        
        textView = UITextView()
        textView.backgroundColor = .clear
        textView.textColor = .white
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name: "AppleSDGothicNeo-Light", size: 40)
        textView.text = "Make Planning Easy"
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Continue to App", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        
        for index in 0..<images.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
           // frame.origin.y = scrollView.frame.size.height - 10
            frame.size = scrollView.frame.size
            let imageView = UIImageView(frame: frame)
            imageView.image = UIImage(named: images[index])
            let backgroundMaskView = UIView(frame: frame)
            backgroundMaskView.backgroundColor = UIColor(white: 0.0, alpha: 0.6)
            self.scrollView.addSubview(imageView)
            self.scrollView.addSubview(backgroundMaskView)
            self.scrollView.addSubview(textView)
        }
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(images.count), height: scrollView.frame.height)
        scrollView.delegate = self
        
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        view.addSubview(button)
        view.addSubview(infoButton)

        setUpConstraints()
    }
    
    @objc func login(){
        let vc = HomeViewController() as! UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func getInfo(){
        let vc = InfoViewController() as! UIViewController
        present(vc, animated: true, completion: nil)
    }

    
    func setUpConstraints(){
        
        NSLayoutConstraint.activate([
            infoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            infoButton.heightAnchor.constraint(equalToConstant: 60),
            infoButton.widthAnchor.constraint(equalToConstant: 60),
            infoButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            pageControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 160)
            ])
        
        NSLayoutConstraint.activate([
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.widthAnchor.constraint(equalToConstant: 160),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -18)
            ])
        
    }
    
    func scrollViewDidEndDecelarating(_ scrollView: UIScrollView){  
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
}
