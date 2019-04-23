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
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
