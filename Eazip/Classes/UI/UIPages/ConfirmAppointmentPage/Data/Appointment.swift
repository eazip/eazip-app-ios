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
    var date : String
    var hour : Int
    var address : [String:String]
    var customer : Customer
    
    init(sewerFirstName: String, sewerLastName: String, sewerRating: Int, sewerBio: String, sewerStreet: String, sewerCity: String) {
        self.sewer = SewerProfile(sewerFirstName: sewerFirstName, sewerLastName: sewerLastName, sewerRating: sewerRating, sewerBiography: sewerBio, sewerCity: sewerCity, sewerStreet: sewerStreet)
        self.products = [Product()]
        self.date = "Jeudi 13 Janvier 2019"
        self.hour = 16
        self.address = ["street": sewerStreet, "city": sewerCity]
        self.customer = Customer()
    }
}

