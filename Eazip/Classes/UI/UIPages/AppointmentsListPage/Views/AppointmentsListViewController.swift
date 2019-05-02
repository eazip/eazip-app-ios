//
//  AppointmentsListViewController.swift
//  Eazip
//
//  Created by Marie on 01/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class AppointmentsListViewController: UIViewController {

    @IBOutlet weak var appointmentsListCollectionView: UICollectionView!
    let lastAppointments : [[String : Any]] = [["appointment": Appointment(), "status": 2], ["appointment": Appointment(), "status": 2]]
    let nextAppointments : [[String: Any]] = [["appointment": Appointment(), "status": 1]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAppointmentsListCollectionView()
    }
    
    func initAppointmentsListCollectionView() {
        //Init cell
        setUpAppointmentTileView()
        
        //Init delegate and datasource
        appointmentsListCollectionView?.delegate = self
        appointmentsListCollectionView?.dataSource =  self
        
        //Layout content position
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 17
        layout.itemSize = UICollectionViewFlowLayoutAutomaticSize
        layout.estimatedItemSize = CGSize(width: 1, height:1)
        
        appointmentsListCollectionView?.collectionViewLayout = layout
    }
    
    func setUpAppointmentTileView() {
        initAppointmentTileCell(cellIdentifier: "AppointmentTileViewCell")
    }
    
    func initAppointmentTileCell(cellIdentifier: String) {
        appointmentsListCollectionView?.register(UINib(nibName:cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }
}
