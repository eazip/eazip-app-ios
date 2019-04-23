//
//  ConfirmScreenTemplate.swift
//  Eazip
//
//  Created by Marie on 22/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

typealias SewerProfileShortViewCellConfig = CollectionCellConfigurator<SewerProfileShortViewCell, SewerProfile>
typealias ProductsDetailsCellConfig = CollectionCellConfigurator<ProductsDetailsViewCell, [Product]>
typealias AppointmentCellConfig = CollectionCellConfigurator<AppointmentViewCell, Appointment>

class ConfirmScreenTemplate {
    var appointment : Appointment
    
    init(data: Appointment) {
        self.appointment = Appointment()
    }
    
    func templateWithData() -> [CellConfigurator] {
        let items : [CellConfigurator] = [
            SewerProfileShortViewCellConfig.init(item: appointment.sewer),
            ProductsDetailsCellConfig.init(item: appointment.products),
            AppointmentCellConfig.init(item: appointment)
        ]
        
        return items
    }
}
