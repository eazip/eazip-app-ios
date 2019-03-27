//
//  Sewer.swift
//  Eazip
//
//  Created by Marie on 26/03/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import Foundation
import UIKit

class SewerProfile {
    var sewerPicture : UIImage
    var sewerName : String
    var sewerRating : Int
    var sewerBiography : String
    var sewerWorks : Array<Any>
    var sewerReviews : Array<Any>
    
    init(picture: UIImage, name: String, rating: Int, biography: String, works: Array<Any>, reviews: Array<Any>) {
        self.sewerPicture = picture
        self.sewerName = name
        self.sewerRating = rating
        self.sewerBiography = biography
        self.sewerWorks = works
        self.sewerReviews = reviews
    }
}
