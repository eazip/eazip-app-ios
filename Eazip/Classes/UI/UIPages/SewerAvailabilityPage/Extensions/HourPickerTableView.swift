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
        cell?.selectionStyle = .none
        
        if offerStatus {
            cell?.initOfferCard()
        }
        
        cell?.setNormalCellBehaviour()
        
        if selectedHour != 0 && selectedHour == hour {
            cell?.setSelectedCellBehaviour()
        }
        
        if selectedDay == Date().currentDay && hour < Date().currentHour + 2 {
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
            cell.selectionStyle = .none
            cell.tapAnimation()
            if cell.isCellAvailable() {
                cell.selectionStyle = .none
                if indexPath.section == 0 {
                    selectedHour = hoursToDisplay["AM"]![indexPath.row]["nb"] as! Int
                } else {
                    selectedHour = hoursToDisplay["PM"]![indexPath.row]["nb"] as! Int
                }
                cell.setSelectedCellBehaviour()
            }
        }
        toggleNavigationAvailability()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let isCell = tableView.cellForRow(at: indexPath) {
            let cell = isCell as! HourPickerViewCell
            cell.setDeselectedCellBehaviour()
        }
        toggleNavigationAvailability()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: hourPickerTableView.frame.size.width, height: 30))
        footerView.backgroundColor = UIColor.white
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}
