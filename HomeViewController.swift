//
//  HomeViewController.swift
//  Wanderlust
//
//  Created by Mihikaa Goenka on 8/6/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, UISearchResultsUpdating, CityDelegate {
    
    var main: MainTabBarController!
    var search: UISearchBar!
    var cityCollectionView: UICollectionView!
    var filterCollectionView: UICollectionView!
    var filters: [Filter] = []
    var activeContinentNameFilter: Set<ContinentName> = []
    var activeLocationTypeFilter: Set<LocationType> = []
    var cities : [City] = []
    var searchedCities: [City] = []
    var activeCities: [City] = []
    var refresh: UIRefreshControl!
    let filterCellReuseIdentifier = "filterCellReuseIdentifier"
    let cityCellReuseIdentifier = "cityCellReuseIdentifier"
    let padding: CGFloat = 8
    let filterCollectionViewHeight: CGFloat = 50
    let searchController = UISearchController(searchResultsController: nil)
    let myColor: UIColor = UIColor(red: 255/255, green: 118/255, blue: 109/255, alpha: 1)
    let profile = Profile(profileName: "Your Name", profileEmail: "Your Preferred Email", profileInterests: "Any Interests?", profileDestinations: "Dream Destinations")
    var profileButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authenticateUserAndConfigureView()
    }
    
    func configureView(){
        
        title = "Home"
        view.backgroundColor = .black
        edgesForExtendedLayout = []
        navigationController?.navigationBar.barTintColor = .white
        
        profileButton = UIButton()
        profileButton.setImage(UIImage(named: "profilepage"), for: .normal)
        profileButton.addTarget(self, action: #selector(goToProfile), for: .touchUpInside)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.widthAnchor.constraint(equalToConstant: 28).isActive = true
        profileButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        let barButton = UIBarButtonItem(customView: profileButton)
        self.navigationItem.rightBarButtonItem = barButton
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(handleSignOut))
        
        refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(pulledToRefresh), for: .valueChanged)
        
        cities = CityAPI.getCities()
        searchedCities = cities
        activeCities = cities
        filters = CityAPI.getFilters()
        
        //Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for Cities"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        //Setup the Search Bar
        search = UISearchBar()
        search.placeholder = "Search for Cities"
        search.barTintColor = .white
        search.layer.borderColor = myColor.cgColor
        search.layer.borderWidth = 1
        search.delegate = self
        search.layer.cornerRadius = 10
        search.translatesAutoresizingMaskIntoConstraints = false
        let textFieldInsideSearchBar = search.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.backgroundColor = .clear
        textFieldInsideSearchBar?.textColor = .blue
        view.addSubview(search)
        
        cityCollectionView = UICollectionView(frame: .zero, collectionViewLayout: CityCollectionViewFlowLayout())
        cityCollectionView.translatesAutoresizingMaskIntoConstraints = false
        cityCollectionView.backgroundColor = .black
        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self
        cityCollectionView.register(CityCollectionViewCell.self, forCellWithReuseIdentifier: cityCellReuseIdentifier)
        
        view.addSubview(cityCollectionView) 
        
        filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: FilterCollectionViewFlowLayout())
        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        filterCollectionView.backgroundColor = .clear
        filterCollectionView.dataSource = self
        filterCollectionView.delegate = self
        filterCollectionView.allowsMultipleSelection = true
        filterCollectionView.showsHorizontalScrollIndicator = false
        filterCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: filterCellReuseIdentifier)
        view.addSubview(filterCollectionView)
        
        setUpConstraints()
    }
    
    func setUpConstraints(){
        
        NSLayoutConstraint.activate([
            filterCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filterCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            filterCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            filterCollectionView.heightAnchor.constraint(equalToConstant: filterCollectionViewHeight)])
        
        NSLayoutConstraint.activate([
            cityCollectionView.topAnchor.constraint(equalTo: filterCollectionView.bottomAnchor, constant: 5),
            cityCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cityCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cityCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }
    
    //MARK: - Selectors
    @objc func handleSignOut(){
        let alertController = UIAlertController(title: nil, message: "Are you sure you want to sign out", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: {(_) in
            self.signOut()
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func goToProfile(){
        let vc = UserProfileViewController() as! UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

    func authenticateUserAndConfigureView(){
        if Auth.auth().currentUser == nil{
            DispatchQueue.main.async {
                let navController = UINavigationController(rootViewController: LoginViewController())
                self.present(navController, animated: true,completion: nil)
            }
        }
        else{
            configureView()
        }
    }
    
    func signOut(){
        do{
            try Auth.auth().signOut()
            let navController = UINavigationController(rootViewController: LoginViewController())
            self.present(navController, animated: true,completion: nil)
        }
        catch let error{
            print("Failed to sign out with error")
        }
    }
    
    // Returns true if the text is empty or nil
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        searchedCities = cities.filter({( city: City) -> Bool in
            return city.name.lowercased().contains(searchText.lowercased())
        })
        
        cityCollectionView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    @objc func pulledToRefresh() {
        main = MainTabBarController()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.refresh.endRefreshing()
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == filterCollectionView{
            return filters.count
        }
        else if isFiltering() {
            return searchedCities.count
        }
        return activeCities.count
    }
    
    //add filter on selection
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == filterCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filterCellReuseIdentifier, for: indexPath) as? FilterCollectionViewCell else { return }
            let currentFilter = filters[indexPath.item]
            changeFilter(filter: currentFilter, shouldRemove: false)
            cityCollectionView.reloadData()
        }
        else{
            let city = activeCities[indexPath.item]
            let destination = CityViewController()
            destination.city = city
            destination.cityDelegate = self
            self.navigationController?.pushViewController(destination, animated: true)
            //let tab = MainTabBarController()
            //self.navigationController?.pushViewController(tab, animated: false)
        }
    }
    
    //remove filter on deselection
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == filterCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filterCellReuseIdentifier, for: indexPath) as? FilterCollectionViewCell else { return }
            let currentFilter = filters[indexPath.item]
            changeFilter(filter: currentFilter, shouldRemove: true)
            cityCollectionView.reloadData()
        }
    }
    
    func changedCity(item: Int, city: City) {
        cityCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == filterCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filterCellReuseIdentifier, for: indexPath) as? FilterCollectionViewCell else { return UICollectionViewCell() }
            let filter = filters[indexPath.item]
            cell.configure(for: filter)
            return cell
        }
        else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cityCellReuseIdentifier, for: indexPath) as? CityCollectionViewCell else {return UICollectionViewCell() }
            cell.backgroundColor = .black
            let city: City
            if isFiltering(){
                city = searchedCities[indexPath.item]
            } else {
                city = activeCities[indexPath.item]
            }
            cell.configure(for: city)
            return cell
        }
    }
    
    func changeFilter(filter: Filter, shouldRemove: Bool = false) {
        if let continent = filter as? ContinentName {
            if shouldRemove {
                activeContinentNameFilter.remove(continent)
            } else {
                activeContinentNameFilter.insert(continent)
            }
        }
        if let landscape = filter as? LocationType {
            if shouldRemove {
                activeLocationTypeFilter.remove(landscape)
            } else {
                activeLocationTypeFilter.insert(landscape)
            }
        }
        filterCities() //now filter the restaurants according to our activeFilters
    }
    
    func filterCities() {
        if activeContinentNameFilter.count == 0 && activeLocationTypeFilter.count == 0{
            activeCities = cities
            return
        }
        activeCities = cities.filter({ r in
            var continentNameFilteredOut = activeContinentNameFilter.count > 0
            if activeContinentNameFilter.count > 0 {
                if activeContinentNameFilter.contains(r.continent){
                    continentNameFilteredOut = false
                }
            }
            var locationTypeFilteredOut = activeLocationTypeFilter.count > 0
            if activeLocationTypeFilter.count > 0 {
                for location in r.landscape {
                    if activeLocationTypeFilter.contains(location) {
                        locationTypeFilteredOut = false
                    }
                }
            }
            return !(continentNameFilteredOut||locationTypeFilteredOut)
        })
    }
}

