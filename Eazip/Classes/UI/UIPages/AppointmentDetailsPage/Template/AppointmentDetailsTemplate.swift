//
//  AppointmentDetailsTemplate.swift
//  Eazip
//
//  Created by Marie on 03/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class AppointmentDetailsTemplate {
    var appointment : Appointment
    
    init(data: Appointment) {
        self.appointment = Appointment(sewerFirstName: "", sewerLastName: "", sewerRating: 0, sewerBio: "")
    }
    
    func templateWithData() -> [CellConfigurator] {
        let items : [CellConfigurator] = [
            SewerProfileShortViewCellConfig.init(item: appointment.sewer),
            ProductsDetailsCellConfig.init(item: appointment.products),
            AppointmentCellConfig.init(item: appointment),
        ]
        
        return items
    }
}

