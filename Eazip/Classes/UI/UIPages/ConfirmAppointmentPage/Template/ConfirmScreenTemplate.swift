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
typealias PaymentMethodsCellConfig = CollectionCellConfigurator<PaymentMethodsViewCell, Customer>
typealias PromoCodeCellConfig = CollectionCellConfigurator<PromoCodeViewCell, [Product]>

class ConfirmScreenTemplate {
    var appointment : Appointment
    
    init(data: Appointment) {
        self.appointment = data.self
    }
    
    func templateWithData() -> [CellConfigurator] {
        let items : [CellConfigurator] = [
            SewerProfileShortViewCellConfig.init(item: appointment.sewer),
            ProductsDetailsCellConfig.init(item: appointment.products),
            AppointmentCellConfig.init(item: appointment),
            PaymentMethodsCellConfig.init(item: appointment.customer),
            PromoCodeCellConfig.init(item: appointment.products)
        ]
        
        return items
    }
}
