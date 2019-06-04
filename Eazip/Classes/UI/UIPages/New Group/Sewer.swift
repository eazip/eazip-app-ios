//
//  Sewer.swift
//  Eazip
//
//  Created by Marie on 31/01/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import Foundation
import UIKit

class Sewer {
    var sewerId: Int
    var sewerBio: String
    var sewerPicture: UIImage
    var sewerFirstName: String
    var sewerLastName: String
    var sewerRating: Int
    var sewerWorksNb: Int
    var sewerStreet: String
    var sewerCity: String
    
    init(id: Int, bio: String, img: UIImage, firstName: String, lastName: String, rating: Int, works: Int, street: String, city: String) {
        self.sewerId = id
        self.sewerBio = bio
        self.sewerPicture = img
        self.sewerFirstName = firstName
        self.sewerLastName = lastName
        self.sewerRating = rating
        self.sewerWorksNb = works
        self.sewerStreet = street
        self.sewerCity = city
    }
}

