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
    var sewerRank : String
    var sewerWorksNb : String
    
    init(img: UIImage, name: String, rank: String, works: String ) {
        self.sewerPicture = img
        self.sewerName = name
        self.sewerRank = rank
        self.sewerWorksNb = works
    }
}

