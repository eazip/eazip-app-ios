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
    @IBOutlet weak var radioIcon: UIImageView!
    
    // Textes
    let offerCardText : String = "Heure creuse -30 %"
    let hourIndicative : String = "h00"
    
    // Main Cell Colors
    let normalCellBackgroundColor : UIColor = UIColor.white
    let selectedCellBackgroundColor : UIColor = UIColor(named: "backgroundLightGrey")!
    let normalCellTextColor : UIColor = UIColor.black
    let unvailableCellTextColor : UIColor = UIColor(named: "lightGrey")!
    
    var availableCell : Bool = true
    
    /**
     /////////////////////
     Up
     /////////////////////
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpOfferCard()
    }
    
    override func layoutSubviews() {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
         setNormalCellBehaviour()
    }
    
    func setUpOfferCard() {
        // Layer
        offerCard?.layer.masksToBounds = false
        offerCard?.layer.borderWidth = 1
        offerCard?.layer.cornerRadius = 5
        offerCard?.layer.borderColor = UIColor(named: "peachColor")?.cgColor
        offerLabel?.textAlignment = .center
        // Text
        offerLabel?.font = FontHelper.avenirBookFontWithSize(size: 12)
        offerLabel?.text = offerCardText
        offerLabel?.textColor = UIColor(named: "peachColor")
        
        disableOfferCard()
    }
    
    func setData(hour: Int) {
        let hourToString : String = String(describing: hour)
        hourChoiceLabel.text = hourToString + hourIndicative
    }
    
    func initOfferCard() {
        enableOfferCard()
    }
    
    func disableOfferCard() -> Void {
       offerCard.isHidden = true
    }
    
    func enableOfferCard() -> Void {
        offerCard.isHidden = false
    }
    
    func setNormalCellBehaviour() {
        radioIcon.image = UIImage(named: "radio_empty")
        self.backgroundColor = normalCellBackgroundColor
        hourChoiceLabel?.textColor = UIColor.black
        hourChoiceLabel?.alpha = 1
        offerCard?.alpha = 1
        
        availableCell = true
    }
    
    func setUnvailableCellBehaviour() {
        disableOfferCard()
        hourChoiceLabel?.textColor = unvailableCellTextColor
        hourChoiceLabel?.alpha = 0.30
        offerCard?.alpha = 0.30
        
        availableCell = false
    }
    
    func isCellAvailable() -> Bool {
        return availableCell
    }
    
    func setDeselectedCellBehaviour() {
        radioIcon.image = UIImage(named: "radio_empty")
    }
    
    func setSelectedCellBehaviour() {
        radioIcon.image = UIImage(named: "radio_full")
    }
    
    func tapAnimation() {
        UIView.animate(withDuration: 0.2, animations: {
            self.backgroundColor = UIColor(named: "lightPeachColor")
            self.backgroundColor = UIColor.white
        })
    }
}
