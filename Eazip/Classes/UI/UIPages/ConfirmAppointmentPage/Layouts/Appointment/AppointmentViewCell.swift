//
//  AppointmentViewCell.swift
//  Eazip
//
//  Created by Marie on 23/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class AppointmentViewCell: UICollectionViewCell, ConfigurableCell {
    @IBOutlet weak var dateIndicationLabel: EazipLabel!
    @IBOutlet weak var addressTitleLabel: EazipLabel!
    @IBOutlet weak var hourIndicationLabel: DefaultText!
    @IBOutlet weak var addressStreetIndicationLabel: DefaultText!
    @IBOutlet weak var addressCityIndicationLabel: DefaultText!
    
    let smallerFont = FontHelper.eazipDefaultBlackFontWithSize(size: 15)
  
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpMainIndicationsTitles()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setUpMainIndicationsTitles() {
        dateIndicationLabel.font = smallerFont
        addressTitleLabel.font = smallerFont
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        
        return layoutAttributes
    }
    
    func configure(data appointment: Appointment) {
        let hour = String(describing: appointment.hour)
        dateIndicationLabel.text = appointment.date
        hourIndicationLabel.text = "Dès " + hour + "h00"
        addressTitleLabel.text = "Domicile"
        addressStreetIndicationLabel.text = appointment.address["street"]
        addressCityIndicationLabel.text = appointment.address["city"]
    }
}
