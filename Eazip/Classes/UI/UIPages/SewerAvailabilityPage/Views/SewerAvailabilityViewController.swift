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
   
    var selectedMonth = Date().currentMonth
    var selectedYear = Date().currentYear
    var selectedDay = [Date().currentDay]
    var selectedHour : [Int] = []
    
    var calendarData : [String: Any] = [:]
    var monthsToDisplay : [String] = []
    var daysToDisplay : [[String: Any]] = []
    
    let hoursToDisplay = ["AM": [["nb": 8, "offer": true],["nb": 9, "offer": false],["nb": 10, "offer": false],["nb": 11, "offer": true]],
                         "PM": [["nb": 14, "offer": false],["nb": 15, "offer": false],["nb": 16, "offer": true],["nb": 17, "offer": true]]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDatePickerCollectionView()
        initHourPickerTableView()
        setUpContinueButton()
    }
    
    func initDatePickerCollectionView() {
        //Init date component
        updateDatePicker()
        
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
  
    func updateDatePicker() {
        calendarData = DatePickerHelper.renderFromSelectedMonthInYear(selectedYear: selectedYear, selectedMonth: selectedMonth)
        monthsToDisplay = calendarData["months"] as! [String]
        daysToDisplay = calendarData["days"] as! [[String : Any]]
        dateSelectLabel.text = calendarData["headerMonthLabel"] as? String
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
        let dateDay = date["dayLabel"] as! String
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
            selectedDay = [indexPath.row]
            cell.toggleSelected()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! DatePickerViewCell
        if cell.isCellAvailable() == true {
            collectionView.deselectItem(at: IndexPath(row: 0, section: selectedDay[0]), animated: true)
            selectedDay = []
            cell.toggleSelected()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return hoursToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (section == 0) ? hoursToDisplay["AM"]!.count : hoursToDisplay["PM"]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hourItem : [String : Any]
        if indexPath.section == 0 {
            hourItem = hoursToDisplay["AM"]![indexPath.row]
        } else {
            hourItem = hoursToDisplay["PM"]![indexPath.row]
        }
        
        let hour = hourItem["nb"] as! Int
        let offerStatus = hourItem["offer"] as! Bool
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HourPickerViewCell") as! HourPickerViewCell?
        cell?.setData(hour: hour)
        
        if offerStatus {
            cell?.initOfferCard()
        }
        
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
        sectionLabel.font = FontHelper.eazipDefaultBlackFontWithSize(size: 17)
        sectionLabel.sizeToFit()
        headerView.addSubview(sectionLabel)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}
