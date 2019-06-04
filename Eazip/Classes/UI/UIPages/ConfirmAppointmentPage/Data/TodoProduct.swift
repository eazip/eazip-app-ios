//
//  TodoProduct.swift
//  Eazip
//
//  Created by Marie on 22/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

class TodoProduct {
    var quantity : Int
    var price : Int
    var description : String
    
    init(quantity: Int, price: Int, description: String) {
        self.quantity = quantity
        self.price = price
        self.description = description
    }
}
