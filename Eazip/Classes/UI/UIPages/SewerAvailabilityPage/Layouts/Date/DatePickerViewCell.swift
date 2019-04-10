//
//  DatePickerViewCell.swift
//  Eazip
//
//  Created by Marie on 04/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class DatePickerViewCell: UICollectionViewCell {
    // Outlets
    @IBOutlet weak var cellContentView: UIView?
    @IBOutlet weak var dayNbLabel: EazipLabel!
    @IBOutlet weak var dayTitleLabel: EazipLabel!
    
    // Main Cell Colors
    let borderColor : UIColor = UIColor(named: "borderLightGrey")!
    let normalCellBackgroundColor : UIColor = UIColor.white
    let selectedCellBackgroundColor : UIColor = UIColor(named: "peachColor")!
    let unvailableCellBackgroundColor : UIColor = UIColor(named: "backgroundLightGrey")!
    let unvailableCellTextColor : UIColor = UIColor(named: "lightGrey")!
    let normalCellTextColor : UIColor = UIColor.black
    let selectedCellTextColor : UIColor = UIColor.white
    
    /**
     /////////////////////
        Up
     /////////////////////
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellContentView?.layer.masksToBounds = false
        
        // Cell border behaviour
        cellContentView?.layer.borderWidth = 1
        cellContentView?.layer.cornerRadius = 7
        cellContentView?.layer.borderColor = borderColor.cgColor
        
        // Cell text behaviour
        dayTitleLabel.font = FontHelper.avenirBlackFontWithSize(size: 13)
        dayTitleLabel.textAlignment = .center
        dayNbLabel.textAlignment = .center
        cellContentView?.bringSubview(toFront: dayTitleLabel!)
        cellContentView?.bringSubview(toFront: dayNbLabel!)
    }
    
    func setData(dayNb: String, dayTitle: String) {
        dayNbLabel?.text = dayNb
        dayTitleLabel?.text = dayTitle
    }
    
    func isCellAvailable() -> Bool {
        if cellContentView?.backgroundColor == unvailableCellBackgroundColor {
            return false
        }
        
        return true
    }
    
    func toggleSelected() {
        if (isSelected) {
            setSelectedCellBehaviour()
        } else {
            setDeselectedCellBehaviour()
        }
    }
    
    private func setDeselectedCellBehaviour() {
        cellContentView?.backgroundColor = normalCellBackgroundColor
        dayNbLabel?.textColor = normalCellTextColor
        dayTitleLabel?.textColor = normalCellTextColor
    }
    
    private func setSelectedCellBehaviour() {
        cellContentView?.backgroundColor = selectedCellBackgroundColor
        dayNbLabel?.textColor = selectedCellTextColor
        dayTitleLabel?.textColor = selectedCellTextColor
    }
    
    func setUnvailableCellBehaviour() {
        cellContentView?.backgroundColor = unvailableCellBackgroundColor
        dayNbLabel?.textColor = unvailableCellTextColor
        dayTitleLabel?.textColor = unvailableCellTextColor
    }
}
