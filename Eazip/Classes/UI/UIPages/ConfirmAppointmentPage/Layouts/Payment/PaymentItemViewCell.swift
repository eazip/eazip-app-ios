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
       
    }
    
    func setUpWrapper() {
        paymentItemWrapper.layer.borderWidth = 1
        paymentItemWrapper.layer.cornerRadius = 5
        paymentItemWrapper.layer.borderColor = borderColor.cgColor
        paymentItemWrapper.backgroundColor = UIColor.blue
        paymentItemWrapper.bringSubview(toFront: CBIcon!)
    }
    
    func setData(cbType: String, cbNb: Int) {
        let cbNBToString = String(describing: cbNb)
        let img = "cb_icon_" + cbType
        currentCBLabel.text = "Carte bleue " + cbNBToString
        CBIcon.image = UIImage(named:img)
    }
}
