//
//  PaymentItemViewCell.swift
//  Eazip
//
//  Created by Marie on 23/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class PaymentItemViewCell: UITableViewCell {
    @IBOutlet weak var currentCBLabel: BoldLabel!
    @IBOutlet weak var CBIcon: UIImageView!
    @IBOutlet weak var paymentItemWrapper: UIView!
    
    // Main Colors
    let borderColor : UIColor = UIColor(named: "borderLightGrey")!
    
    /**
     /////////////////////
     Up
     /////////////////////
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpWrapper()
        currentCBLabel.font = FontHelper.avenirBlackFontWithSize(size: 15)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
    }
    
    func setUpWrapper() {
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.layer.borderColor = borderColor.cgColor
    }
    
    func setData(cbType: String, cbNb: Int) {
        let cbNBToString = String(describing: cbNb)
        let img = "cb_icon_" + cbType
        currentCBLabel.text = "Carte bleue " + cbNBToString
        CBIcon.image = UIImage(named:img)
    }
}
