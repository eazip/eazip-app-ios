//
//  Appointment.swift
//  Eazip
//
//  Created by Marie on 22/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

class Appointment {
    var sewer : SewerProfile
    var products : [Product]
    
    init() {
        self.sewer = SewerProfile()
        self.products = [Product(), Product()]
    }
}

