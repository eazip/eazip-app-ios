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
        offerCard?.layer.borderColor = UIColor.black.cgColor
        offerLabel?.textAlignment = .center
        // Text
        offerLabel?.font = FontHelper.avenirBookFontWithSize(size: 12)
        offerLabel?.text = offerCardText
        
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
       offerCard?.isHidden = false
    }
    
    func enableOfferCard() -> Void {
        offerCard?.isHidden = true
    }
    
    func setNormalCellBehaviour() {
        self.backgroundColor = normalCellBackgroundColor
        hourChoiceLabel?.textColor = UIColor.black
        hourChoiceLabel?.alpha = 1
        offerCard?.alpha = 1
        
        availableCell = true
    }
    
    func setUnvailableCellBehaviour() {
        hourChoiceLabel?.textColor = unvailableCellTextColor
        hourChoiceLabel?.alpha = 0.30
        offerCard?.alpha = 0.30
        
        availableCell = false
    }
    
    func isCellAvailable() -> Bool {
        return availableCell
    }
    
    func setDeselectedCellBehaviour() {
        self.backgroundColor = normalCellBackgroundColor
    }
    
    func setSelectedCellBehaviour() {
        self.backgroundColor = selectedCellBackgroundColor
    }
    
    func tapAnimation() {
        UIView.animate(withDuration: 0.2, animations: {
            self.backgroundColor = UIColor(named: "lightPeachColor")
            self.backgroundColor = UIColor.white
        })
    }
}
