//
//  Place.swift
//  Wanderlust
//
//  Created by Mihikaa Goenka on 8/8/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import Foundation
import UIKit

protocol Choice {
    var filterImage: UIImage { get }
}

enum ChoiceType: Choice {

    case hotel
    case club
    case restaurant
    case site

    var filterImage: UIImage { //return the enum title with first letter uppercased
        return UIImage(named: String(describing: self))!
    }

    static func allValues() -> [ChoiceType] {
        return [.hotel, .club, .restaurant, .site]
    }

}

class Place{
    
    var placeTitle: String
    var placeLocation: String
    var placeType: ChoiceType
    var address: String
    var placeDescription: String
    var placeImage: UIImage!
    var isFavorite: Bool
    
    init(placeTitle: String, placeLocation: String, placeType: ChoiceType, placeDescription: String, placeImage: UIImage, address: String) {
        self.placeTitle = placeTitle
        self.placeType = placeType
        self.placeLocation = placeLocation
        self.placeDescription = placeDescription
        self.placeImage = placeImage
        self.isFavorite = false
        self.address = address
    }
}
