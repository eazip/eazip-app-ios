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
    var sewerWorks : Array<Any>
    var sewerReviews : Array<Any>
    
    init(picture: UIImage, name: String, rating: Int, works: Array<Any>, reviews: Array<Any>) {
        self.sewerPicture = img
        self.sewerName = name
        self.sewerRating = rating
        self.sewerWorks = works
        self.sewerReviews = sewerReviews
    }
}
