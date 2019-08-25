//
//  CityAPI.swift
//  Wanderlust
//
//  Created by Mihikaa Goenka on 8/6/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import Foundation

class CityAPI {
    
    static func getCities() -> [City] {
        
        let paris = City(name: "Paris", cityimagestring: "paris", continent: .europe, landscape: [.city])
        let miami = City(name: "Miami", cityimagestring: "miami", continent: .northamerica, landscape: [.beach, .city])
        let london = City(name: "London", cityimagestring: "london", continent: .europe, landscape: [.city])
        let lasvegas = City(name: "Las Vegas", cityimagestring: "lasvegas", continent: .northamerica, landscape: [.city])
        let mumbai = City(name: "Mumbai", cityimagestring: "mumbai", continent: .asia, landscape: [.city])
        let dubai = City(name: "Dubai", cityimagestring: "dubai", continent: .asia, landscape: [.city])
        let newyork = City(name: "New York City", cityimagestring: "newyork", continent: .northamerica, landscape: [.city])
        let capetown = City(name: "Cape Town", cityimagestring: "capetown", continent: .africa, landscape: [.city, .grassland])
        let sydney = City(name: "Sydney", cityimagestring: "sydney", continent: .australia, landscape: [.city])
        let cities = [paris, miami, london, lasvegas, mumbai, dubai, newyork, capetown, sydney]
        return cities
    }
    
    static func getFilters() -> [Filter] {
        var filters: [Filter] = []
        filters.append(contentsOf: ContinentName.allValues().map({ f in f as Filter }))
        filters.append(contentsOf: LocationType.allValues().map({ f in f as Filter }))
        return filters
    }
}
