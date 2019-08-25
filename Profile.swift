//
//  Profile.swift
//  Wanderlust
//
//  Created by Mihikaa Goenka on 8/20/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import Foundation

class Profile {
    var profileName: String
    var profileEmail: String
    var profileInterests: String
    var profileDestinations: String
    
    init(profileName: String, profileEmail: String, profileInterests: String, profileDestinations: String){
        self.profileName = profileName
        self.profileEmail = profileEmail
        self.profileInterests = profileInterests
        self.profileDestinations = profileDestinations
    }
}
