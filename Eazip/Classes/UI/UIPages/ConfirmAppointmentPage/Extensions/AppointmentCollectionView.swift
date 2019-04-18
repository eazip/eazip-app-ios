//
//  AppointmentCollectionView.swift
//  Eazip
//
//  Created by Marie on 18/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//
import UIKit

extension ConfirmAppointmentViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        return appointmentSections
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 115, height: 115)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SewerProfileShortViewCell", for: indexPath) as! SewerProfileShortViewCell
        
        cell.configure(data: 2)
        return cell
    }
}
