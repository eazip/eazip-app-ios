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
    var appointment = Appointment(sewerFirstName: "", sewerLastName: "", sewerRating: 0, sewerBio: "", sewerStreet: "", sewerCity: "", day: 0, month: "", year: 0, hour: 0)
    var totalPrice : Int = 0
    var appointmentSections : Int = 0
    var currentProfile: Sewer = Sewer(id: 0, bio: "", img: UIImage(named: "sewerPicture1")!, firstName: "", lastName: "", rating: 0, works: 0, street: "", city: "")
    var appointmentDate: Date? = nil
    var selectedClothes: [[String: Any]] = []

    
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
        appointment = initAppointmentData()
    }
    
    func initAppointmentData() -> Appointment {
        return Appointment(sewerFirstName: currentProfile.sewerFirstName, sewerLastName: currentProfile.sewerLastName, sewerRating: currentProfile.sewerRating, sewerBio: currentProfile.sewerBio, sewerStreet: currentProfile.sewerStreet, sewerCity: currentProfile.sewerCity, day: appointmentDate?.currentDay ?? 0, month: formatMonthValue(monthCode: appointmentDate?.currentMonth ?? 0), year: appointmentDate?.currentYear ?? 0, hour: appointmentDate?.currentHour ?? 0)
    }
    
    func formatMonthValue(monthCode: Int) -> String {
        switch monthCode {
        case 1:
          return "Janvier"
        case 2:
            return "Février"
        case 3:
            return "Mars"
        case 4:
            return "Avril"
        case 5:
            return "Mai"
        case 6:
            return "Juin"
        case 7:
            return "Juillet"
        case 8:
            return "Août"
        case 9:
            return "Septembre"
        case 10:
            return "Octobre"
        case 11:
            return "Novembre"
        case 12:
            return "Décembre"
        default:
            return "Janvier"
        }
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
//        setTotalPrice(totalPrice: totalPrice)
    }
    
    func setTotalPrice(totalPrice: Int) {
        let totalPriceToString = String(describing: totalPrice)
        totalPriceNbLabel.text = totalPriceToString + " €"
    }
    
    func nextStep() -> Void {
        if !didAlertAppear {
            let parameters: NSDictionary = ["command": ["sewer_id": currentProfile.sewerId, "customer_id": 1, "appointment_at": "\(appointmentDate?.currentYear)-\(appointmentDate?.currentMonth)-\(appointmentDate?.currentDay)T\(appointmentDate?.currentHour):00:00+0100", "services": [[1, 2]]]]
            
            let url = URL(string: "http://ec2-35-180-118-48.eu-west-3.compute.amazonaws.com/commands")
            var request = URLRequest(url: url!)
            request.httpMethod="POST"
            guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
            request.httpBody = httpBody
            
            let session = URLSession.shared
            session.dataTask(with: request) { (data, response, error) in
                if let response = response {
                    print("response", response)
                }
                
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        g
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }.resume()
            
            
            let appointmentAlert = alertHelper.appointmentAlert(date: String(appointmentDate?.currentDay ?? 0) + " " + formatMonthValue(monthCode: appointmentDate?.currentMonth ?? 0) + " " + String(appointmentDate?.currentYear ?? 0), sewerName: currentProfile.sewerFirstName, hour: String(appointmentDate?.currentHour ?? 0),status: AlertHelper.AlertAppointmentType.created) {
                [weak self] in
                self?.performSegue(withIdentifier: "currentSewerAppointmentDetails", sender: self)
                self?.goToScreen(identifier: "AppointmentDetailsViewController")
            }
            present(appointmentAlert, animated: true)
            didAlertAppear = true
        } else {
            goToScreen(identifier: "AppointmentsListViewController")
        }
    }
    
    @IBAction func back(_ sender: Any) {
        performSegue(withIdentifier: "currentDateBackToDatePicker", sender: self)
        goToScreen(identifier: "SewerAvailabilityViewController")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "currentSewerAppointmentDetails" {
            let vc = segue.destination as! AppointmentDetailsViewController
            vc.self.currentProfile = currentProfile
            vc.self.appointmentDate = appointmentDate
        }
        
        if segue.identifier == "currentDateBackToDatePicker" {
            let vc = segue.destination as! SewerAvailabilityViewController
            vc.self.currentProfile = currentProfile
            vc.self.appointment = appointmentDate
            vc.self.selectedClothes = selectedClothes
        }
    }
}
