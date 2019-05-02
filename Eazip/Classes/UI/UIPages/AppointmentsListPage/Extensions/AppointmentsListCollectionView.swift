//
//  AppointmentsListCollectionView.swift
//  Eazip
//
//  Created by Marie on 01/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

extension AppointmentsListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (section == 0) ? nextAppointments.count : lastAppointments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: appointmentsListCollectionView.bounds.size.width, height: 185)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = (indexPath.section == 0) ? nextAppointments[indexPath.row] : lastAppointments[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppointmentTileViewCell", for: indexPath as IndexPath) as! AppointmentTileViewCell
        
        cell.setData(appointment: item["appointment"] as! Appointment)
        
        let appointmentStatus = item["status"] as! Int
        
        if appointmentStatus == 1 {
            cell.setNextAppointmentBehaviour()
        } else {
            cell.setLastAppointmentBehaviour()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
        let titleView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "appointmentStatusLabel", for: indexPath) as! AppointmentStatusLabel
        
        let title = (indexPath.section == 0) ? "Retouches à venir" : "Retouches effectuées"
        
        titleView.setData(label: title)
        
        return titleView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 20, 0)
    }
}
