//
//  Customer.swift
//  Eazip
//
//  Created by Marie on 23/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

class Customer {
    var paymentMethods : [[String: Any]]
    
    init() {
        self.paymentMethods = [["cbType" : "visa", "cbNb" : 1234]]
    }
}
