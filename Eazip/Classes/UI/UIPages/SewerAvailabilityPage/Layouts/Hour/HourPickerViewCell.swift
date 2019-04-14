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
    @IBOutlet weak var offerCard: UIView!
    @IBOutlet weak var offerLabel: DefaultText!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpOfferCard()
    }
    
    override func layoutSubviews() {
    }
    
    func setUpOfferCard() {
        offerCard?.layer.masksToBounds = false
        offerCard?.layer.borderWidth = 1
        offerCard?.layer.cornerRadius = 5
        offerCard?.layer.borderColor = UIColor.black.cgColor
        offerLabel?.textAlignment = .center
        offerLabel?.font = FontHelper.avenirBookFontWithSize(size: 12)
        offerLabel?.text = "Heure creuse -30 %"
        
        disableOfferCard()
    }
    
    func setData(hour: Int) {
        let hourToString : String = String(describing: hour)
        hourChoiceLabel.text = hourToString + "h00"
    }
    
    func initOfferCard() {
        enableOfferCard()
    }
    
    func disableOfferCard() -> Void {
       offerCard?.isHidden = false
    }
    
    func enableOfferCard() -> Void {
        offerCard?.isHidden = true
    }
}
