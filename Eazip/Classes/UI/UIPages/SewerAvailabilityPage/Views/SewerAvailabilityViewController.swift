//
//  SewerAvailabilityViewController.swift
//  Eazip
//
//  Created by Marie on 04/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class SewerAvailabilityViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var dateSelectLabel: UITextField!
    @IBOutlet weak var datePickerCollectionView: UICollectionView!
    @IBOutlet weak var hourPickerTableView: UITableView!
    @IBOutlet weak var continueButton: ColoredActionButton!
    
    let hourAM = [8, 9, 10, 11]
    let hourPM = [14, 15, 16, 17]
    
    var monthsToDisplay : [String] = []
    var daysToDisplay : [[String: Any]] = []
    var selectedMonth : Int = 0
    var selectedYear : Int = 0
    var selectedDay : [IndexPath] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDatePickerCollectionView()
        initHourPickerTableView()
        setUpContinueButton()
    }
    
    func initDatePickerCollectionView() {
        //Init date component
        initDatePicker()
        
        //Init cell
        initDatePickerCell(cellIdentifier: "DatePickerViewCell")
        
        //Init delegate and datasource
        datePickerCollectionView?.delegate = self
        datePickerCollectionView?.dataSource =  self
        datePickerCollectionView?.showsHorizontalScrollIndicator = false
        datePickerCollectionView?.allowsMultipleSelection = false
        
        //Layout content position
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 30
        layout.itemSize = CGSize(width: 70, height: 70)
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        datePickerCollectionView?.collectionViewLayout = layout
    }
    
    func initHourPickerTableView() {
        //Init cell
        initHourPickerCell(cellIdentifier: "HourPickerViewCell")
        
        //Init delegate and datasource
        hourPickerTableView?.delegate = self
        hourPickerTableView?.dataSource =  self
    }
  
    func initDatePicker() {
        let calendarLabels = CalendarHelper().getCalendarLabels()
        let totalNumberOfMonthsInYear = calendarLabels["months"]?.count
        
        let currentYear : Int = Date().currentYear
        let currentMonth : Int = Date().currentMonth
        let currentDay : Int = Date().currentDay

        selectedYear = currentYear
        selectedMonth = currentMonth
      
        // render //
         let monthsForCurrentYear = calendarLabels["months"]![currentMonth-1..<totalNumberOfMonthsInYear!]
        let totalNumberOfDaysInMonth = CalendarHelper().getNumberOfDaysForMonth(year: selectedYear, month: selectedMonth)

        var daysForCurrentMonth : [[String: Any]] = []
        
        for dayIndex in currentDay..<totalNumberOfDaysInMonth {
            let dayNb = dayIndex
            let weekdayNb = CalendarHelper().getWeekDayNbForDate(year: selectedYear, month: selectedMonth, day: dayNb)
            let dayLabel = calendarLabels["days"]![weekdayNb-1]
            
            let dataDay = ["dayLabel": dayLabel, "dayNb": dayNb, "status":true] as [String : Any]
            daysForCurrentMonth.append(dataDay)
        }
        
        monthsToDisplay = Array(monthsForCurrentYear)
        daysToDisplay = daysForCurrentMonth
    }
    
    func initDatePickerCell(cellIdentifier: String) {
        datePickerCollectionView?.register(UINib(nibName:cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }
    
    func initHourPickerCell(cellIdentifier: String) {
        hourPickerTableView?.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func setUpContinueButton() {
        continueButton?.setTitle("Continuer", for: .normal)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        return daysToDisplay.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 70, height: 70)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let date = daysToDisplay[indexPath.row]
        let dateNb = String(describing: date["dayNb"] ?? "")
        let dateDay = String(Array(date["dayLabel"] as? String ?? "")[0..<3])
        let availabilityStatus = date["status"] as! Bool
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DatePickerViewCell", for: indexPath) as! DatePickerViewCell
        cell.setData(dayNb: dateNb, dayTitle: dateDay)
        
        if availabilityStatus == false {
            cell.setUnvailableCellBehaviour()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! DatePickerViewCell
        if cell.isCellAvailable() == true {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
            selectedDay = [indexPath]
            cell.toggleSelected()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! DatePickerViewCell
        if cell.isCellAvailable() == true {
            collectionView.deselectItem(at: selectedDay[0], animated: true)
            selectedDay = []
            cell.toggleSelected()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (section == 0) ? hourAM.count : hourPM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hourItem : Int
        if indexPath.section == 0 {
            hourItem = hourAM[indexPath.row]
        } else {
            hourItem = hourPM[indexPath.row]
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "HourPickerViewCell") as! HourPickerViewCell?
        cell?.setData(hour: hourItem)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let sectionLabel = EazipLabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
        if section == 0 {
            sectionLabel.text = "Matin"
        } else {
            sectionLabel.text = "Après-midi"
        }
        headerView.backgroundColor = UIColor.white
        sectionLabel.sizeToFit()
        headerView.addSubview(sectionLabel)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
