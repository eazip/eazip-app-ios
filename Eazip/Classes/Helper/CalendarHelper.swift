//
//  CalendarHelper.swift
//  Eazip
//
//  Created by Marie on 10/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import Foundation
import UIKit

class CalendarHelper {
    let formatter = DateFormatter()
    
    func createNewDateFromValues(year: Int, month: Int, day: Int, hour: Int) -> Date {
        let dateComponents = DateComponents(year: year, month: month, day: day, hour: hour)
        
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(identifier:"CET")!
        
        let date = calendar.date(from: dateComponents)
    
        return date!
    }
    
    func getWeekDayNbForDate(year: Int, month: Int, day: Int) -> Int {
        let dateComponents = DateComponents(year: year, month: month, day: day)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!
        let weekdayNb : Int = calendar.component(.weekday, from: date)
        
        return weekdayNb
    }
    
    func getNumberOfDaysForMonth(year: Int, month: Int) -> Int {
        let dateComponents = DateComponents(year: year, month: month)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!
        let range = calendar.range(of: .day, in: .month, for: date)!
        let numberOfDays = range.count
        
        return numberOfDays
    }
    
    func getCalendarLabels() -> [String: [String]] {
        setFrenchLocale(formatter: formatter)
        var monthsLabels : [String] = []
        var daysLabels : [String] = []
        
        for monthLabel in formatter.monthSymbols {
            monthsLabels.append(monthLabel.pascalCase)
        }
        for dayLabel in formatter.shortWeekdaySymbols {
            daysLabels.append(dayLabel.pascalCase)
        }
        
        let calendarLabels = ["months": monthsLabels,
                              "days": daysLabels]
       
        return calendarLabels
    }
    
    private func setFrenchLocale(formatter: DateFormatter) -> Void {
        formatter.locale = Locale(identifier: "FR-fr")
    }
}

