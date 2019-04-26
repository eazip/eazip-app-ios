//
//  ClothsList.swift
//  Eazip
//
//  Created by Quentin Michalet on 29/01/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import Foundation
import UIKit

class ClothItem {
    var cloth_id: Int
    var icon: UIImage
    var title: String
    var selected: Bool
    
    init(cloth_id: Int, icon: UIImage, title: String, selected: Bool) {
        self.cloth_id = cloth_id
        self.icon = icon
        self.title = title
        self.selected = selected
    }
}
