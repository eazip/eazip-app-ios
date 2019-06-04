//
//  AppointmentsListViewController.swift
//  Eazip
//
//  Created by Marie on 01/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class AppointmentsListViewController: UIViewController {

    @IBOutlet weak var headerviewLabel: EazipLabel!
    @IBOutlet weak var appointmentsListCollectionView: UICollectionView!

    let lastAppointments : [[String : Any]] = [["appointment": Appointment(sewerFirstName: "", sewerLastName: "", sewerRating: 0, sewerBio: "", sewerStreet: "", sewerCity: "", day: 0, month: "", year: 0, hour: 0), "status": 2], ["appointment": Appointment(sewerFirstName: "", sewerLastName: "", sewerRating: 0, sewerBio: "", sewerStreet: "", sewerCity: "", day: 0, month: "", year: 0, hour: 0), "status": 2]]
    let nextAppointments : [[String: Any]] = [["appointment": Appointment(sewerFirstName: "", sewerLastName: "", sewerRating: 0, sewerBio: "", sewerStreet: "", sewerCity: "", day: 0, month: "", year: 0, hour: 0), "status": 1]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHeaderView()
        initAppointmentsListCollectionView()
    }
    
    func setUpHeaderView() {
        headerviewLabel.textAlignment = .center
        headerviewLabel.text = "Mes retouches"
    }
    
    func initAppointmentsListCollectionView() {
        //Init cell
        setUpAppointmentTileView()
        
        //Init delegate and datasource
        appointmentsListCollectionView?.delegate = self
        appointmentsListCollectionView?.dataSource =  self
        appointmentsListCollectionView?.showsVerticalScrollIndicator = false
        
        //Layout content position
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 2
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
