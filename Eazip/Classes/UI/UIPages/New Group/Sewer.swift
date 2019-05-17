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
    var sewerPicture : UIImage
    var sewerName : String
    var sewerRating : Int
    var sewerWorksNb : Int
    
    init(img: UIImage, name: String, rating: Int, works: Int) {
        self.sewerPicture = img
        self.sewerName = name
        self.sewerRating = rating
        self.sewerWorksNb = works
    }
}

