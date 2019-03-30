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
    var sewerReviews : [SewerReview]
    
    init() {
        self.sewerPicture = UIImage(named:"sewerPicture2")!
        self.sewerName = "Alice Moneroe"
        self.sewerRating = 4
        self.sewerBiography = "Denique Antiochensis ordinis vertices sub uno elogio iussit occidi ideo efferatus, quod ei celebrari vilitatem intempestivam urgenti, cum inpenderet inopia, gravius rationabili responderunt; et perissent ad unum ni comes orientis tunc Honoratus fixa constantia restitisset."
        self.sewerWorks = [UIImage(named:"sewerPicture2")!, UIImage(named:"sewerPicture2")!,UIImage(named:"sewerPicture2")!]
        self.sewerReviews = [SewerReview(author: "Toto", textContent: "Haec igitur prima lex amicitiae sanciatur, ut ab amicis honesta petamus, amicorum causa honesta faciamus. Ut ab amicis honesta petamus, amicorum causa honesta faciamus", rating: 3),SewerReview(author: "Titi", textContent: "Haec igitur prima lex amicitiae sanciatur, ut ab amicis honesta petamus, amicorum causa honesta faciamus. Ut ab amicis honesta petamus, amicorum causa honesta faciamus", rating: 4)]
    }
}
