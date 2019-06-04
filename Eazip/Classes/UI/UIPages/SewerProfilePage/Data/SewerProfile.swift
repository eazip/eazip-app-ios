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
    var sewerCity: String
    var sewerStreet: String
    var sewerWorks : Array<Any>
    var sewerReviews : [SewerReview]
    
    init(sewerFirstName: String, sewerLastName: String, sewerRating: Int, sewerBiography: String, sewerCity: String, sewerStreet: String) {
        self.sewerPicture = UIImage(named:"sewerPicture1")!
        self.sewerName = sewerFirstName + " " + sewerLastName
        self.sewerRating = sewerRating
        self.sewerBiography = sewerBiography
        self.sewerCity = sewerCity
        self.sewerStreet = sewerStreet
        self.sewerWorks = [UIImage(named:"sewerPicture2")!, UIImage(named:"sewerPicture2")!,UIImage(named:"sewerPicture2")!]
        self.sewerReviews = [SewerReview(author: "Toto", textContent: "Haec igitur prima lex amicitiae sanciatur, ut ab amicis honesta petamus, amicorum causa honesta faciamus. Ut ab amicis honesta petamus, amicorum causa honesta faciamus", rating: 3),SewerReview(author: "Titi", textContent: "Haec igitur prima lex amicitiae sanciatur, ut ab amicis honesta petamus, amicorum causa honesta faciamus. Ut ab amicis honesta petamus, amicorum causa honesta faciamus. Haec igitur prima lex amicitiae sanciatur, ut ab amicis honesta petamus, amicorum causa honesta faciamus. Ut ab amicis honesta petamus, amicorum causa honesta faciamus", rating: 4)]
    }
}
