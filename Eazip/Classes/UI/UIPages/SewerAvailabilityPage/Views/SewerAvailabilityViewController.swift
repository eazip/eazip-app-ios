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
    @IBOutlet weak var nextMonthButton: UIButton!
    @IBOutlet weak var previousMonthButton: UIButton!
    @IBOutlet weak var datePickerCollectionView: UICollectionView!
    @IBOutlet weak var hourPickerTableView: UITableView!
    @IBOutlet weak var continueButton: ColoredActionButton!
    var appointment : Date? = nil
    var navigationAllowed : Bool = false
    
    @IBAction func newAppointment(_ sender: UIButton) {
        createAppointmentFromData()
        nextStep()
    }
    
    var firstDay : Int? = nil
   
    var selectedMonth = Date().currentMonth
    var selectedYear = Date().currentYear
    var selectedDay : Int? = nil
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
        toggleNavigationAvailability()
    }
    
    @IBAction func previousMonth(_ sender: Any) {
        if selectedYear == Date().currentYear {
            if selectedMonth > Date().currentMonth {
                selectedMonth -= 1
            }
            if selectedMonth == Date().currentMonth {
                selectedDay = Date().currentDay
            }
        }
        if selectedYear > Date().currentYear {
            if selectedMonth == 1 {
                selectedYear -= 1
                selectedMonth = 12
            } else {
                selectedMonth -= 1
            }
        }
        updateDatePicker()
        datePickerCollectionView.reloadData()
        hourPickerTableView.reloadData()
    }
    
    @IBAction func nextMonth(_ sender: Any) {
        if selectedMonth == 12 {
            selectedYear += 1
            selectedMonth = 1
        } else {
            selectedMonth += 1
        }
        updateDatePicker()
        datePickerCollectionView.reloadData()
        hourPickerTableView.reloadData()
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
        hourPickerTableView.backgroundColor = UIColor.white
        
        //Init cell
        initHourPickerCell(cellIdentifier: "HourPickerViewCell")
        
        //Init delegate and datasource
        hourPickerTableView?.delegate = self as UITableViewDelegate
        hourPickerTableView?.dataSource = self as UITableViewDataSource
        hourPickerTableView?.isScrollEnabled = false
    }
  
    func updateDatePicker() {
        initFirstDay()
        calendarData = DatePickerHelper.renderFromSelectedMonthInYear(selectedYear: selectedYear, selectedMonth: selectedMonth)
        monthsToDisplay = calendarData["months"] as! [String]
        daysToDisplay = calendarData["days"] as! [[String : Any]]
        if selectedMonth == Date().currentMonth && firstDay != Date().currentDay {
            daysToDisplay.remove(at: 0)
        }
        dateSelectLabel.text = calendarData["headerMonthLabel"] as? String
    }
    
    func initFirstDay() {
        if selectedMonth == Date().currentMonth {
            if Date().currentHour >= 15 && selectedMonth == Date().currentMonth {
                firstDay = Date().currentDay + 1
            } else {
                firstDay = Date().currentDay
            }
        } else {
            firstDay = 1
        }
        selectedDay = firstDay!
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
        appointment = DatePickerHelper.createNewDateFromValues(year: selectedYear, month: selectedMonth, day: selectedDay!, hour: selectedHour)
        print(appointment!)
    }
    
    func toggleNavigationAvailability() {
        if selectedHour == 0 {
            makeNextStepUnavailable()
        } else {
            makeNextStepAvailable()
        }
    }
    
    func makeNextStepUnavailable() {
        navigationAllowed = false
        continueButton.isHidden = true
    }
    
    func makeNextStepAvailable() {
        navigationAllowed = true
        continueButton.isHidden = false
    }
    
    func nextStep() -> Void {
        if navigationAllowed {
            goToScreen(identifier: "ConfirmAppointmentViewController")
        }
    }
}
