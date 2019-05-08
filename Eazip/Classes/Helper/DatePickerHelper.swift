//
//  DatePickerHelper.swift
//  Eazip
//
//  Created by Marie on 13/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import Foundation
import UIKit

class DatePickerHelper {
    static let currentYear : Int = Date().currentYear
    static let currentMonth : Int = Date().currentMonth
    static let currentDay : Int = Date().currentDay
    static let calendarLabels = CalendarHelper().getCalendarLabels()
    static let totalNumberOfMonthsInYear : Int = 12
    
    static func createNewDateFromValues(year: Int, month: Int, day: Int, hour: Int) -> Date {
        return CalendarHelper().createNewDateFromValues(year: year, month: month, day: day, hour: hour)
    }
    
    static func renderFromSelectedMonthInYear(selectedYear: Int, selectedMonth: Int) -> [String : Any] {
        let nextMonthsCurrentYear = getAvailableNextMonthsFromSelectedYear(selectedYear: selectedYear)
        let nextDaysForCurrentMonth = getAvailableNextDaysFromSelectedMonth(selectedYear: selectedYear, selectedMonth: selectedMonth)
        
        let currentMonthLabelToDisplay = getMonthLabelFromRange(monthRange: selectedMonth)
        let currentYearLabelToDisplay = String(selectedYear)
        
        let headerLabelToDisplay = currentMonthLabelToDisplay + " " + currentYearLabelToDisplay
        let monthLabelsToDisplay = Array(nextMonthsCurrentYear)
        let daysToDisplay = nextDaysForCurrentMonth
        
        return ["headerMonthLabel": headerLabelToDisplay,
              "months": monthLabelsToDisplay,
              "days": daysToDisplay
             ]
    }
    
    static func getAvailableNextMonthsFromSelectedYear(selectedYear: Int) -> ArraySlice<String> {
        let firstAvailableMonth : Int
        if selectedYear == currentYear {
            firstAvailableMonth = currentMonth
        } else {
            firstAvailableMonth = 1
        }
        
        let availableNextMonths = calendarLabels["months"]![firstAvailableMonth-1..<totalNumberOfMonthsInYear]
        
        return availableNextMonths
    }
    
    static func getAvailableNextDaysFromSelectedMonth(selectedYear: Int, selectedMonth: Int) -> [[String: Any]] {
        let totalDaysInMonth = CalendarHelper().getNumberOfDaysForMonth(year: selectedYear, month: selectedMonth)
        
        let firstAvailableDay : Int
        if selectedMonth == currentMonth {
            firstAvailableDay = currentDay
        } else {
            firstAvailableDay = 1
        }
        
        var availableNextDays : [[String: Any]] = []
        for dayIndex in firstAvailableDay...totalDaysInMonth {
            let dayNb = dayIndex
            let weekdayNb = CalendarHelper().getWeekDayNbForDate(year: selectedYear, month: selectedMonth, day: dayNb)
            let dayLabel = calendarLabels["days"]![weekdayNb-1]
            
            let dataDay = ["dayLabel": dayLabel, "dayNb": dayNb, "status":true] as [String : Any]
            availableNextDays.append(dataDay)
        }
        
        return availableNextDays
    }
    
    static func getMonthLabelFromRange(monthRange: Int) -> String {
        let monthLabel = calendarLabels["months"]![monthRange-1]
        
        return monthLabel
    }
}
