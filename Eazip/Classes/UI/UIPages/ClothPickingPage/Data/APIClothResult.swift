//
//  APIClothResult.swift
//  Eazip
//
//  Created by Quentin Michalet on 26/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import Foundation

struct APIClothResult: Decodable {
    var cloth: Cloth
}

struct Cloth: Decodable {
    var id: Int
    var image: String
    var label: String
    var type: String
}

