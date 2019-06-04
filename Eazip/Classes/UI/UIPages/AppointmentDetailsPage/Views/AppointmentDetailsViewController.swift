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
    var appointment = Appointment(sewerFirstName: "", sewerLastName: "", sewerRating: 0, sewerBio: "", sewerStreet: "", sewerCity: "", day: 0, month: "", year: 0, hour: 0)
    var appointmentSections : Int = 0
    var currentProfile: Sewer = Sewer(id: 0, bio: "", img: UIImage(named: "sewerPicture1")!, firstName: "", lastName: "", rating: 0, works: 0, street: "", city: "")
    var appointmentDate: Date? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHeaderView()
        setUpBanner()
        initAppointmentConfirmationCollectionView()
        setUpCancellationWrapper()
        appointment = initAppointmentData()
    }
    
    func initAppointmentData() -> Appointment {
        return Appointment(sewerFirstName: currentProfile.sewerFirstName, sewerLastName: currentProfile.sewerLastName, sewerRating: currentProfile.sewerRating, sewerBio: currentProfile.sewerBio, sewerStreet: currentProfile.sewerStreet, sewerCity: currentProfile.sewerCity, day: appointmentDate?.currentDay ?? 0, month: formatMonthValue(monthCode: appointmentDate?.currentMonth ?? 0), year: appointmentDate?.currentYear ?? 0, hour: appointmentDate?.currentHour ?? 0)
    }
    
    func setUpHeaderView() {
        headerviewLabel.textAlignment = .center
        headerviewLabel.text = String(appointmentDate?.currentDay ?? 0) + " " + formatMonthValue(monthCode: appointmentDate?.currentMonth ?? 0) + " " + String(appointmentDate?.currentYear ?? 0)
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
    
    @IBAction func resetUserFlow(_ sender: Any) {
        self.performSegue(withIdentifier: "goToTabBar", sender: self)
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
}
