//
//  SewerAvailabilityViewController.swift
//  Eazip
//
//  Created by Marie on 04/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class SewerAvailabilityViewController: UIViewController {

    @IBOutlet weak var dateSelectLabel: UITextField!
    @IBOutlet weak var datePickerCollectionView: UICollectionView!
    @IBOutlet weak var hourPickerTableView: UITableView!
    @IBOutlet weak var continueButton: ColoredActionButton!
    
    @IBAction func newAppointment(_ sender: UIButton) {
        createAppointmentFromData()
    }
   
    var selectedMonth = Date().currentMonth
    var selectedYear = Date().currentYear
    var selectedDay : Int = Date().currentDay
    var selectedHour : Int = 0
    
    var calendarData : [String: Any] = [:]
    var monthsToDisplay : [String] = []
    var daysToDisplay : [[String: Any]] = []
    let hoursToDisplay = HoursToDisplay.getHours()
    
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
        hourPickerTableView?.delegate = self as UITableViewDelegate
        hourPickerTableView?.dataSource = self as UITableViewDataSource
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
    
    func createAppointmentFromData() {
        print(DatePickerHelper.createNewDateFromValues(year: selectedYear, month: selectedMonth, day: selectedDay, hour: selectedHour))
    }
    
    func renderHoursAvailibility() -> Void {
        
    }
}
