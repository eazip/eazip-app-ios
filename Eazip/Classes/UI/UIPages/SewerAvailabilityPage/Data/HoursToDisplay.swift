//
//  HoursToDisplay.swift
//  Eazip
//
//  Created by Marie on 16/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

class HoursToDisplay {
    static func getHours() -> [String : [[String : Any]]] {
        let hoursToDisplay = ["AM": [["nb": 8, "offer": true],["nb": 9, "offer": false],["nb": 10, "offer": false],["nb": 11, "offer": true]],
                              "PM": [["nb": 14, "offer": false],["nb": 15, "offer": false],["nb": 16, "offer": true],["nb": 17, "offer": true]]]
        return hoursToDisplay
    }
}
