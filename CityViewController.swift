//
//  CityViewController.swift
//  Wanderlust
//
//  Created by Mihikaa Goenka on 8/8/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit

protocol CityDelegate {
    func changedCity(item: Int, city: City)
}

protocol AddPlaceDelegate: class {
    func addNewPlace(to title: String, to location: String, to address: String, to type: String, to description: String, to photo: UIImage?)
}

protocol FavoriteDelegate : class{
    func favoritePressed(for cell: PlaceCollectionViewCell)
}

class CityViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource, FavoriteDelegate, AddPlaceDelegate {
    
    var x: Place!
    var city: City!
    var cityDelegate: CityDelegate!
    
    var choices: [Choice] = []
    var activeChoiceTypeFilter: Set<ChoiceType> = []
    var choiceCollectionView: UICollectionView!
    let choiceCellReuseIdentifier = "choiceCellReuseIdentifier"
    let padding: CGFloat = 5
    let choiceCollectionViewHeight: CGFloat = 100
        
    var placeCollectionView: UICollectionView!
    var createButton: UIButton!
    var allButton: UIButton!
    var state = "all"
    
    var places: [Place] = []
    var activePlaces: [Place] = []
    var favoritedPlaces: [Place] = []

    let placeReuseIdentifier = "placeReuseIdentifier"
    let placePadding: CGFloat = 13
    
    //    var heartButton: UIButton!
    //    var heartedPlaces: [Place]! = []
    
    let defaults = UserDefaults.standard
    struct Key {
        static let favoritedPlaces = "favoritedPlaces"
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = city.name
        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = UIColor(red: 1.0, green: 0.45, blue: 0.42, alpha: 1.0)
        
        choices = ChoiceAPI.getChoices()
        places = ChoiceAPI.getPlaces()
        activePlaces = places
            
        choiceCollectionView = UICollectionView(frame: .zero, collectionViewLayout: ChoiceCollectionViewFlowLayout())
        choiceCollectionView.translatesAutoresizingMaskIntoConstraints = false
        choiceCollectionView.backgroundColor = .white
        choiceCollectionView.dataSource = self
        choiceCollectionView.delegate = self
        choiceCollectionView.allowsMultipleSelection = true
        choiceCollectionView.showsHorizontalScrollIndicator = false
        choiceCollectionView.register(ChoiceCollectionViewCell.self, forCellWithReuseIdentifier: choiceCellReuseIdentifier)
        view.addSubview(choiceCollectionView)
        
        let placeLayout = UICollectionViewFlowLayout()
        placeLayout.scrollDirection = .vertical
        placeLayout.minimumInteritemSpacing = placePadding
        placeLayout.minimumLineSpacing = placePadding
        placeLayout.itemSize = CGSize(width: 350, height: 200)
        
        placeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: placeLayout)
        placeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        placeCollectionView.backgroundColor = .white
        placeCollectionView.dataSource = self
        placeCollectionView.delegate = self
        placeCollectionView.allowsMultipleSelection = false
        placeCollectionView.showsVerticalScrollIndicator = false
        placeCollectionView.register(PlaceCollectionViewCell.self, forCellWithReuseIdentifier: placeReuseIdentifier)
        view.addSubview(placeCollectionView)
        
        createButton = UIButton()
        createButton.setTitle("ADD TO LIST", for: .normal)
        createButton.setTitleColor(UIColor(red:1, green:0.45, blue:0.42, alpha:1.0), for: .normal)
        createButton.titleLabel?.font =  UIFont(name: "AvenirNext-Medium", size: 16)
        createButton.backgroundColor = .white
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.addTarget(self, action: #selector(create), for: .touchUpInside)
        createButton.layer.cornerRadius = 20
        createButton.layer.borderWidth = 2
        createButton.layer.borderColor = UIColor(red:1, green:0.45, blue:0.42, alpha:1.0).cgColor
        createButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        createButton.layer.shadowOpacity = 0.5
        createButton.layer.shadowRadius = 3
        createButton.layer.shadowOffset = CGSize(width: -6, height: 6)
        view.addSubview(createButton)
        
        
        setupConstraints()
        }
    
        func setupConstraints(){
            
            NSLayoutConstraint.activate([
                choiceCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                choiceCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                choiceCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
                choiceCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
                choiceCollectionView.heightAnchor.constraint(equalToConstant: choiceCollectionViewHeight)])
            
            NSLayoutConstraint.activate([
                createButton.topAnchor.constraint(equalTo: choiceCollectionView.bottomAnchor, constant: 20),
                createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                createButton.widthAnchor.constraint(equalToConstant: 200),
                createButton.heightAnchor.constraint(equalToConstant: 40)
                ])

            NSLayoutConstraint.activate([
                placeCollectionView.topAnchor.constraint(equalTo: createButton.bottomAnchor, constant: 10),
                placeCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                placeCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                placeCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
                ])
        }
    
    @objc func create(){
        let vc = AddViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if collectionView == choiceCollectionView{
                return choices.count
            }
            else{
                return activePlaces.count
            }
    }
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if collectionView == choiceCollectionView {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: choiceCellReuseIdentifier, for: indexPath) as? ChoiceCollectionViewCell else { return }
                let currentChoice = choices[indexPath.item]
                changeChoice(filter: currentChoice, shouldRemove: false)
                placeCollectionView.reloadData()
            }
            else{
                 var specific: Place!
                 specific = activePlaces[indexPath.item]
                 let detailView = SpecificDetailView(placeTitle: specific.placeTitle, placeLocation: specific.placeLocation, placeType: specific.placeType, placeDescription: specific.placeDescription, placeImage: specific.placeImage, address: specific.address)
                 self.navigationController?.pushViewController(detailView, animated: true)

            }
    }
    
        
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == choiceCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: choiceCellReuseIdentifier, for: indexPath) as? ChoiceCollectionViewCell else { return }
            let currentChoice = choices[indexPath.item]
            changeChoice(filter: currentChoice, shouldRemove: true)
            placeCollectionView.reloadData()
        }
    }
    
        
        func changedCity(item: Int, city: City) {
            choiceCollectionView.reloadData()
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if collectionView == choiceCollectionView {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: choiceCellReuseIdentifier, for: indexPath) as? ChoiceCollectionViewCell else { return UICollectionViewCell() }
                let choice = choices[indexPath.item]
//              cell.backgroundColor = .white
                cell.configure(for: choice)
                return cell
        }
            else{
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: placeReuseIdentifier, for: indexPath) as? PlaceCollectionViewCell else {return UICollectionViewCell() }
//              cell.backgroundColor = .white
                let place = activePlaces[indexPath.item]
                cell.configure(for: place)
                return cell
            }
    }
    
    func changeChoice(filter: Choice, shouldRemove: Bool = false) {
        if let choiceType = filter as? ChoiceType {
            if shouldRemove {
                activeChoiceTypeFilter.remove(choiceType)
            } else{
                activeChoiceTypeFilter.insert(choiceType)
            }
        }
        filterPlaces()
    }
    
    func filterPlaces(){
        if activeChoiceTypeFilter.count == 0{
            activePlaces = places
            return
        }
        activePlaces = places.filter({ p in
            var placeTypeFilteredOut = activeChoiceTypeFilter.count > 0
            if activeChoiceTypeFilter.count > 0{
                if activeChoiceTypeFilter.contains(p.placeType){
                    placeTypeFilteredOut = false
                }
            }
            return !(placeTypeFilteredOut)
        })
    }
    

    
//    override func viewWillAppear(_ animated: Bool) {
//
//        if let favoritePlaces = UserDefaults.standard.value(forKey: "favoritedPlaces") as? [String] {
//            for name in favoritePlaces {
//                for place in places {
//                    if(name == place.placeTitle) {
//                        place.isFavorite = true
//                    }
//                }
//            }
//        }
//        placeCollectionView.reloadData()
//    }
    
    func addNewPlace(to title: String, to location: String, to address: String, to type: String, to description: String, to photo: UIImage?) {
        print("Add New Event")
    }
    

    func favoritePressed(for cell: PlaceCollectionViewCell) {
        let favoriteCell = placeCollectionView.indexPath(for: cell)
        var place: Place!
        place = places[favoriteCell!.item]
        place.isFavorite = !place.isFavorite
        // setup User Default
        if defaults.value(forKey: Key.favoritedPlaces) == nil {
            defaults.set([], forKey: Key.favoritedPlaces)
            defaults.synchronize()
        }
        if place.isFavorite {
            if var favoritePlaces = defaults.value(forKey: Key.favoritedPlaces) as? [String] {
                favoritePlaces.append(place.placeTitle)
                defaults.set(favoritePlaces, forKey: Key.favoritedPlaces)
                defaults.synchronize()
            }
        } else {
            if var favoritePlaces = defaults.value(forKey: Key.favoritedPlaces) as? [String] {
                favoritePlaces = favoritePlaces.filter {$0 != place.placeTitle}
                defaults.set(favoritePlaces, forKey: Key.favoritedPlaces)
                defaults.synchronize()
            }
        }
        if place.isFavorite {
            if !(favoritedPlaces.contains(where: { $0.placeTitle == place.placeTitle })) {
                favoritedPlaces.append(place)
            }
        } else {
            favoritedPlaces = favoritedPlaces.filter {$0.placeTitle != place.placeTitle}
        }
        placeCollectionView.reloadData()
    }
}


