//
//  AppointmentDetailsViewController.swift
//  Eazip
//
//  Created by Marie on 03/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class AppointmentDetailsViewController: UIViewController {

    @IBOutlet weak var bannerWrapper: UIView!
    @IBOutlet weak var bannerLabel: UILabel!
    @IBOutlet weak var appointmentDetailsCollectionView: UICollectionView!
    @IBOutlet weak var cancellationWrapper: UIView!
    @IBOutlet weak var cancellationButton: UIButton!
    @IBOutlet weak var cancellationLabel: UILabel!
    @IBOutlet weak var headerviewLabel: EazipLabel!
    
    //Data
    let appointment = Appointment()
    var appointmentSections : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHeaderView()
        setUpBanner()
        initAppointmentConfirmationCollectionView()
        setUpCancellationWrapper()
    }
    
    func setUpHeaderView() {
        headerviewLabel.textAlignment = .center
        headerviewLabel.text = "Jeudi 13 Janvier · 16h"
    }
    
    func setUpBanner() {
        setUpBannerWrapper()
        setUpBannerLabel()
    }
    
    func setUpBannerWrapper() {
        bannerWrapper.backgroundColor = UIColor(named: "darkPeachColor")
    }
    
    func setUpBannerLabel() {
        //UI
        bannerLabel.textColor = UIColor.white
        bannerLabel.textAlignment = .center
        bannerLabel.font = FontHelper.avenirBlackFontWithSize(size: 12)
        
        //Text
        let sewerName = appointment.sewer.sewerName
        bannerLabel.text = sewerName + " n’a pas encore accepté votre demande"
    }
    
    func initAppointmentConfirmationCollectionView() {
        //Init cells
        setUpShortProfileView()
        setUpProductsDetailsView()
        setUpAppointmentView()
        
        //Init delegate and datasource
        appointmentDetailsCollectionView?.delegate = self
        appointmentDetailsCollectionView?.dataSource =  self
        
        //Layout content position
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.itemSize = UICollectionViewFlowLayoutAutomaticSize
        layout.estimatedItemSize = CGSize(width: 1, height:1)
        
        appointmentDetailsCollectionView?.collectionViewLayout = layout
    }
    
    func setUpShortProfileView() {
        initAppointmentDeatailsCell(cellIdentifier: "SewerProfileShortViewCell")
    }
    
    func setUpProductsDetailsView() {
        initAppointmentDeatailsCell(cellIdentifier: "ProductsDetailsViewCell")
    }
    
    func setUpAppointmentView() {
        initAppointmentDeatailsCell(cellIdentifier: "AppointmentViewCell")
    }
    
    func initAppointmentDeatailsCell(cellIdentifier: String) {
        appointmentDetailsCollectionView?.register(UINib(nibName:cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        appointmentSections = appointmentSections + 1
    }
    
    func setUpCancellationWrapper() {
        setUpCancellationLabel()
        setUpCancellationButton()
    }
    
    func setUpCancellationLabel() {
        cancellationLabel.text = "Si vous annulez dans les 48h avant la retouche, vous serez débité du quart de la prestation. (vous serez débité de 5€)"
        cancellationLabel.textAlignment = .center
    }
    
    func setUpCancellationButton() {
        cancellationButton.setTitle("Annuler la retouche", for: .normal)
    }
}
