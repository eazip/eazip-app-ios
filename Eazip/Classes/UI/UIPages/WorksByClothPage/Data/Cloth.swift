//
//  Cloth.swift
//  Eazip
//
//  Created by Marie on 13/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class Cloth {
    var type : ClothItem
    var works : [[String: Any]]
    
    init() {
        self.type = ClothItem(cloth_id: 1, icon: UIImage(named: "robe")!, title: "Robe", selected: false)
        self.works = [
            ["category":"Raccourcir", "data": [TodoProduct(), TodoProduct()]],
            ["category":"Raccourcir", "data": [TodoProduct(), TodoProduct()]]
        ]
    }
}
