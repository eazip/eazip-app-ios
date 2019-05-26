//
//  DatePickerCollectionView.swift
//  Eazip
//
//  Created by Marie on 15/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//
import UIKit

extension SewerAvailabilityViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        return daysToDisplay.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 70, height: 70)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var date = daysToDisplay[indexPath.row]

        let dateNb = String(describing: date["dayNb"] ?? "")
        let dateDay = date["dayLabel"] as! String
        let availabilityStatus = date["status"] as! Bool
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DatePickerViewCell", for: indexPath) as! DatePickerViewCell

        cell.setData(dayNb: dateNb, dayTitle: dateDay)

        if indexPath.row == (selectedDay! - firstDay!) {
            cell.setSelectedCellBehaviour()
        }
        
        if availabilityStatus == false {
            cell.setUnvailableCellBehaviour()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let isCell = collectionView.cellForItem(at: indexPath) {
            let cell = isCell as! DatePickerViewCell
            if cell.isCellAvailable() == true {
                let previousSelectedDay : Int = selectedDay!
                
                collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
                cell.toggleSelected()
                
                if selectedMonth == Date().currentMonth {
                    selectedDay = indexPath.row + firstDay!
                } else {
                     selectedDay = indexPath.row + 1
                }
               
                if selectedDay != previousSelectedDay {
                    selectedHour = 0
                }
                hourPickerTableView?.reloadData()
                toggleNavigationAvailability()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let isCell = collectionView.cellForItem(at: indexPath) {
            let cell = isCell as! DatePickerViewCell
            if cell.isCellAvailable() == true {
                collectionView.deselectItem(at: IndexPath(row: 0, section: selectedDay! - firstDay!), animated: true)
                cell.toggleSelected()
                toggleNavigationAvailability()
            }
        }
    }
}
