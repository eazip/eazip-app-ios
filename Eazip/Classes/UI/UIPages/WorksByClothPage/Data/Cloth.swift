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
    
    init(id: Int, icon: UIImage, title: String, selected: Bool) {
        self.type = ClothItem(cloth_id: id, icon: icon, title: title, selected: selected)
        self.works = [
            ["category":"Raccourcir", "data": [TodoProduct(quantity: 1, price: 15, description: "Raccourcir manches"), TodoProduct(quantity: 1, price: 15, description: "Raccourcir manches")]],
            ["category":"Raccourcir", "data": [TodoProduct(quantity: 1, price: 15, description: "Raccourcir manches"), TodoProduct(quantity: 1, price: 15, description: "Raccourcir manches")]]
        ]
    }
}
