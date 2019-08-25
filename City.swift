//
//  City.swift
//  Wanderlust
//
//  Created by Mihikaa Goenka on 8/6/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import Foundation
import UIKit

protocol Filter {
    var filterTitle: String { get }
}

enum ContinentName: Filter {
    case asia
    case europe
    case northamerica
    case southamerica
    case australia
    case africa
    
    var filterTitle: String { //return the enum title with first letter uppercased
        if String(describing: self) == "northamerica" {
            return "NORTH AMERICA"
        }
        else if String(describing: self) == "southamerica"{
            return "SOUTH AMERICA"
        }
        else{
            return String(describing: self).localizedUppercase
        }
    }
    
    static func allValues() -> [ContinentName] {
        return
            [.asia, .europe, .northamerica, .southamerica, .australia, .africa]
    }
}

enum LocationType: Filter {
    case beach
    case mountain
    case city
    case grassland
    
    var filterTitle: String { //return the enum title with first letter uppercased
        return String(describing: self).localizedUppercase
    }
    
    static func allValues() -> [LocationType] {
        return [.beach, .mountain, .city, .grassland]
    }
}

class City {
    
    var name: String
    var cityimagestring: String
    let continent: ContinentName //can only belong to one continent
    let landscape: [LocationType]
    
    init(name: String, cityimagestring: String, continent: ContinentName, landscape: [LocationType]){
        self.name = name
        self.cityimagestring = cityimagestring
        self.continent = continent
        self.landscape = landscape
    }
}
