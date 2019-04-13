//
//  CurrentDateHelper.swift
//  Eazip
//
//  Created by Marie on 11/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import Foundation

extension Date{
    var currentWeekDay: Int {return  Calendar.current.component(.weekday, from:self)}
    var currentDay : Int {return  Calendar.current.component(.day, from:self)}
    var currentMonth : Int {return  Calendar.current.component(.month, from:self)}
    var currentYear : Int {return Calendar.current.component(.year, from:self)}
}
