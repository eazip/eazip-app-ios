//
//  AlertHelper.swift
//  Eazip
//
//  Created by Marie on 30/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class AlertHelper {
    var storyboard : UIStoryboard
    
    init() {
        storyboard = UIStoryboard(name:"Alert", bundle: .main)
    }
    
    enum AlertAppointmentType : String {
        case created    = "created"
        case confirmed  = "confirmed"
    }
    
    func appointmentAlert(status: AlertAppointmentType, action: @escaping () -> Void) -> AlertViewController {
        var alertViewController : AlertViewController? = nil
        
        switch status {
        case AlertAppointmentType.created:
            alertViewController = appointmentCreatedAlert(action: action)
        case AlertAppointmentType.confirmed: break
            //
        }
        
        return alertViewController!
    }
    
    func appointmentCreatedAlert(action: @escaping () -> Void) -> AlertViewController {
        let alertViewController = self.storyboard.instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
        alertViewController.icon = UIImage(named: "paper_plane")!
        alertViewController.labelTitle = "Votre réservation a bien été émise !"
        alertViewController.body = "Votre demande pour le jeudi 13 janvier, à partir de 16h a bien été envoyée à Alice. Vous recevrez une réponse dans moins de 48h."
        alertViewController.actionButtonText = "Voir le récapitulatif"
        alertViewController.action = action
        
        
        return alertViewController
    }
}
