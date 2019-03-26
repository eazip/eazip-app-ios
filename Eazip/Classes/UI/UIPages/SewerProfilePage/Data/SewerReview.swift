//
//  SewerReview.swift
//  Eazip
//
//  Created by Marie on 25/03/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import Foundation
import UIKit

class SewerReview {
    var author: String
    var textContent: String
    var rating: Int
    
    init(author: String, textContent: String, rating: Int ) {
        self.author = author
        self.textContent = textContent
        self.rating = rating
    }
}
