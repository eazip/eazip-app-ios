//
//  ConfirmAppointmentViewController.swift
//  Eazip
//
//  Created by Marie on 17/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class ConfirmAppointmentViewController: UIViewController {

    @IBOutlet weak var appointmentConfirmationCollectionView: UICollectionView!
    @IBOutlet weak var confirmAppointmentButton: ColoredActionButton!
    
    var appointmentSections : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAppointmentConfirmationCollectionView()
        setUpShortProfileView()

    }
    
    func initAppointmentConfirmationCollectionView() {
        //Init delegate and datasource
        appointmentConfirmationCollectionView?.delegate = self
        appointmentConfirmationCollectionView?.dataSource =  self
    
        //Layout content position
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: 70, height: 70)
        
        appointmentConfirmationCollectionView?.collectionViewLayout = layout
    }
    
    func setUpShortProfileView() {
        initAppointmentSectionCell(cellIdentifier: "SewerProfileShortViewCell")
    }
    
    func initAppointmentSectionCell(cellIdentifier: String) {
        appointmentConfirmationCollectionView?.register(UINib(nibName:cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        appointmentSections = appointmentSections + 1
    }
}
