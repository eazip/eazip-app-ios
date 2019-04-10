//
//  HourPickerViewCell.swift
//  Eazip
//
//  Created by Marie on 05/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class HourPickerViewCell: UITableViewCell {
    @IBOutlet weak var hourChoiceLabel: DefaultText!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
    }
    
    func setData(hour: Int) {
        let hourToString : String = String(describing: hour)
        hourChoiceLabel.text = hourToString + "h00"
    }
}
