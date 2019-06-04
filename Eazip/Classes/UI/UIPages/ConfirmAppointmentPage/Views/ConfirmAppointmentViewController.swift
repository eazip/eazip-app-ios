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
    @IBOutlet weak var totalPriceTitleLabel: EazipLabel!
    @IBOutlet weak var totalPriceNbLabel: EazipLabel!
    @IBOutlet weak var confirmAppointmentButton: ColoredActionButton!
    @IBOutlet weak var headerviewLabel: EazipLabel!
    
    var didAlertAppear : Bool = false
    let alertHelper = AlertHelper()
    
    //Data
    let appointment = Appointment()
    let totalPrice : Int = 0
    var appointmentSections : Int = 0

    
    @IBAction func nextStep(_ sender: Any) {
        nextStep()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHeaderView()
        initAppointmentConfirmationCollectionView()
        setUpShortProfileView()
        setUpProductsDetailsView()
        setUpAppointmentView()
        setUpTotalPriceWrapper()
        setUpRegisterButton()
    }
    
    func setUpHeaderView() {
        headerviewLabel.textAlignment = .center
        headerviewLabel.text = "Confirmer" + "\n" + "la réservation"
    }
    
    func initAppointmentConfirmationCollectionView() {
        //Init delegate and datasource
        appointmentConfirmationCollectionView?.delegate = self
        appointmentConfirmationCollectionView?.dataSource =  self
    
        //Layout content position
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.itemSize = UICollectionViewFlowLayoutAutomaticSize
        layout.estimatedItemSize = CGSize(width: 1, height:1)
        
        appointmentConfirmationCollectionView?.collectionViewLayout = layout
    }
    
    func setUpShortProfileView() {
        initAppointmentSectionCell(cellIdentifier: "SewerProfileShortViewCell")
    }
    
    func setUpProductsDetailsView() {
        initAppointmentSectionCell(cellIdentifier: "ProductsDetailsViewCell")
    }
    
    func setUpAppointmentView() {
        initAppointmentSectionCell(cellIdentifier: "AppointmentViewCell")
    }
    
    func setUpPaymentMethodsView() {
        initAppointmentSectionCell(cellIdentifier: "PaymentMethodsViewCell")
    }
    
    func setUpPromoCodeView() {
        initAppointmentSectionCell(cellIdentifier: "PromoCodeViewCell")
    }
    
    func initAppointmentSectionCell(cellIdentifier: String) {
        appointmentConfirmationCollectionView?.register(UINib(nibName:cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        appointmentSections = appointmentSections + 1
    }
    
    func setUpRegisterButton() {
        confirmAppointmentButton.setTitle("Réserver", for: .normal)
    }
    
    func setUpTotalPriceWrapper() {
        totalPriceTitleLabel.font = FontHelper.eazipDefaultBlackFontWithSize(size: 15)
        totalPriceTitleLabel.text = "Prix final"
        setTotalPrice()
    }
    
    func setTotalPrice() {
        let totalPriceToString = String(describing: totalPrice)
        totalPriceNbLabel.text = totalPriceToString + " €"
    }
    
    func nextStep() -> Void {
        if !didAlertAppear {
            let appointmentAlert = alertHelper.appointmentAlert(status: AlertHelper.AlertAppointmentType.created) {
                [weak self] in
                self?.goToScreen(identifier: "AppointmentDetailsViewController")
            }
            present(appointmentAlert, animated: true)
            didAlertAppear = true
        } else {
            goToScreen(identifier: "AppointmentsListViewController")
        }
    }
}
