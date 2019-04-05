//
//  DatePickerViewCell.swift
//  Eazip
//
//  Created by Marie on 04/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class DatePickerViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dayNbLabel: EazipLabel!
    @IBOutlet weak var dayTitleLabel: EazipLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let borderColor : UIColor = UIColor(named: "borderLightGrey")!
        self.layer.masksToBounds = false
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.layer.borderColor = borderColor.cgColor
        
        dayTitleLabel.font = FontHelper.avenirBlackFontWithSize(size: 13)
        dayTitleLabel.textAlignment = .center
        dayNbLabel.textAlignment = .center
    }
    
    override func layoutSubviews() {
        
    }
    
    func setData(dayNb: String, dayTitle: String) {
        dayNbLabel?.text = dayNb
        dayTitleLabel?.text = dayTitle
    }
}
