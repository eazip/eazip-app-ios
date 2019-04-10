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
    
    let dataDate : [[String: String]] = [
        ["day": "Lundi", "dayNb": "26", "status":true],
        ["day": "Mardi", "dayNb": "27", "status":true],
        ["day": "Mercredi", "dayNb": "28", "status":true],
        ["day": "Jeudi", "dayNb": "29", "status":false],
        ["day": "Vendredi", "dayNb": "30", "status":true]
    ]
    
    let hourAM = [8, 9, 10, 11]
    let hourPM = [14, 15, 16, 17]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDatePickerCollectionView()
        initHourPickerTableView()
        setUpContinueButton()
    }
    
    func initDateSelect() {
        let datePickerInputSelect = UIDatePicker()
        datePickerInputSelect.backgroundColor = UIColor.white
        datePickerInputSelect.datePickerMode = .date
        datePickerInputSelect.addTarget(self, action: #selector(SewerAvailabilityViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SewerAvailabilityViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        dateSelectLabel.inputView = datePickerInputSelect
    }
    
    @objc func dateChanged(datePicker: UIDatePicker)  {
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "MMMM"
       dateSelectLabel?.text = dateFormatter.string(from: datePicker.date)
       view.endEditing(true)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    func initDatePickerCollectionView() {
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
        return dataDate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 70, height: 70)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let date = dataDate[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DatePickerViewCell", for: indexPath) as! DatePickerViewCell
        let dateNb = date["dayNb"]
        let dateDay = String(Array(date["day"] ?? "")[0..<3])
        cell.setData(dayNb: dateNb!, dayTitle: dateDay)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! DatePickerViewCell
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        print("num " + String(describing: indexPath) + " selected")
        cell.toggleSelected()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! DatePickerViewCell
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        print("num " + String(describing: indexPath) + " deselected")
        cell.toggleSelected()
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
