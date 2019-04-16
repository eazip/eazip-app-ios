//
//  HourPickerTableView.swift
//  Eazip
//
//  Created by Marie on 15/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

extension SewerAvailabilityViewController: UITableViewDataSource, UITableViewDelegate {
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
        
        if selectedDay == Date().currentDay && hour < Date().currentHour {
            cell?.setUnvailableCellBehaviour()
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let isCell = tableView.cellForRow(at: indexPath) {
            let cell = isCell as! HourPickerViewCell
            if cell.isCellAvailable() {
                tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableViewScrollPosition.none)
                if indexPath.section == 0 {
                    selectedHour = hoursToDisplay["AM"]![indexPath.row]["nb"] as! Int
                } else {
                    selectedHour = hoursToDisplay["PM"]![indexPath.row]["nb"] as! Int
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let isCell = tableView.cellForRow(at: indexPath) {
            //let cell = isCell as! HourPickerViewCell
            tableView.deselectRow(at: IndexPath(row: 0, section: selectedHour), animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}
