//
//  Product.swift
//  Eazip
//
//  Created by Marie on 19/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

class Product {
    var cloth : String
    var toDo : [TodoProduct]
    
    init() {
        self.cloth = "Robe"
        self.toDo = [TodoProduct(quantity: 1, price: 15, description: "Ourlet simple"), TodoProduct(quantity: 1, price: 15, description: "Ourlet simple")]
    }
}
