//
//  Service.swift
//  Eazip
//
//  Created by Quentin Michalet on 05/06/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class Service {
    var clothId: Int
    var serviceId: Int
    var serviceLabel: String
    var servicePrice: String
    var serviceCategory: String
    
    init(clothId: Int, serviceId: Int, serviceLabel: String, servicePrice: String, serviceCategory: String) {
        self.clothId = clothId
        self.serviceId = serviceId
        self.serviceLabel = serviceLabel
        self.servicePrice = servicePrice
        self.serviceCategory = serviceCategory
    }
}
