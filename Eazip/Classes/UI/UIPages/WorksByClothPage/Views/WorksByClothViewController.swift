//
//  WorksByClothViewController.swift
//  Eazip
//
//  Created by Marie on 11/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class WorksByClothViewController: UIViewController {

    @IBOutlet weak var headerviewLabel: EazipLabel!
    @IBOutlet weak var worksDropDownCollectionView: UICollectionView!
    @IBOutlet weak var validationButton: ColoredActionButton!
    let notExpandedHeight : CGFloat = 70
    
    var servicesList: [Service] = []
    var selectedClothes: [[String: Any]] = []
    var navigationAllowed : Bool = true
    var selectedServices : [[String : Any]] = []
    var expandableDropdownStatesByClothe : [[CGFloat]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getServices()
    }
    
    func getServices() {
        ApiServicesHelper() { servicesList, error in
            if servicesList != nil {
                self.servicesList.append(contentsOf: servicesList!)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self.setUpHeaderView()
                    self.initWorksDropDownCollectionView()
                    self.worksDropDownCollectionView.layoutIfNeeded()
                    self.setUpValidationButton()
                    self.toggleNavigationAvailability()
                }
            }
        }
    }
    
    typealias Apicompletion = (_ servicesList: [Service]?, _ errorString: String?) -> Void
    
    func ApiServicesHelper(completion: Apicompletion?) {
        let url = URL(string: "http://ec2-35-180-118-48.eu-west-3.compute.amazonaws.com/services")
        let session = URLSession.shared
        
        session.dataTask(with: url!) { (data, response, error) in
            var tempServicesList: [Service] = []

            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        if let servicesArray = json["data"] as? NSArray {
                            for service in servicesArray as! [Dictionary<String, AnyObject>] {
                                let clothId = service["clothe"]?["id"] as! Int
                                let serviceId = service["id"] as! Int
                                let serviceLabel = service["alteration"]?["label"] as! String
                                let servicePrice = service["value_base"] as! String
                                let serviceCategory = service["category"]?["type"] as! String
                                
                                tempServicesList.append(Service(clothId: clothId, serviceId: serviceId, serviceLabel: serviceLabel, servicePrice: servicePrice, serviceCategory: serviceCategory))
                            }
                            completion?(tempServicesList, nil)
                        }
                    }
                } catch {
                    completion?(nil, error.localizedDescription)
                }
            }
            }.resume()
        
    }
    
    func setUpHeaderView() {
        headerviewLabel.textAlignment = .center
        headerviewLabel.text = "Choisissez vos" + "\n" + "types de retouches"
    }
    
    func initWorksDropDownCollectionView() {
        //Init headers
        initHeader(headerIdentifier: "ClothHeaderReusableView")
        //Init cell
        initDropDownItemViewCell(cellIdentifier: "WorksDropdownItemViewCell")
        
        //Init cells state
        initExpandableDropdownStatesByClothe()
        
        //Init delegate and datasource
        worksDropDownCollectionView?.delegate = self
        worksDropDownCollectionView?.dataSource = self
  
        //Layout content position
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        
        worksDropDownCollectionView?.collectionViewLayout = layout
    }

    func initDropDownItemViewCell(cellIdentifier: String) {
        worksDropDownCollectionView?.register(UINib(nibName:cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }
    
    func initHeader(headerIdentifier: String) {
         worksDropDownCollectionView?.register(UINib.init(nibName: headerIdentifier, bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
    }
    
    func setUpValidationButton()  {
        validationButton?.setTitle("Chercher un(e) couturier(e)", for: .normal)
    }
    
    func initExpandableDropdownStatesByClothe() {
        if (selectedClothes.count > 0) {
            for _ in (0...selectedClothes.count - 1) {
                expandableDropdownStatesByClothe.append(Array(repeating: notExpandedHeight, count: 3))
            }
        }
    }
    
    func getClothImage(label: String) -> String {
        switch label {
        case "Robe":
            return "robe"
        case "Pantalon":
            return "pantalon"
        case "T-Shirt":
            return "t-shirt"
        case "Jupe":
            return "jupe"
        case "Short":
            return "pantalon"
        case "Pull-over":
            return "pullover"
        case "Blazer":
            return "veste"
        case "Manteau":
            return "manteau"
        default:
            return ""
        }
    }
    
    func toggleNavigationAvailability() {
        if selectedServices.count == 0 {
            makeNextStepUnavailable()
        } else {
            makeNextStepAvailable()
        }
    }
    
    func makeNextStepUnavailable() {
        navigationAllowed = false
        //validationButton?.isHidden = true
    }
    
    func makeNextStepAvailable() {
        navigationAllowed = true
        validationButton?.isHidden = false
    }
    
    @IBAction func next(_ sender: Any) {
        performSegue(withIdentifier: "selectedClothesToSewersPage", sender: self)
        nextStep()
    }
    
    @IBAction func back(_ sender: Any) {
        previousStep()
    }
    
    func previousStep() -> Void {
        goToScreen(identifier: "ClothsPickingViewController")
    }
    
    func nextStep() -> Void {
        goToScreen(identifier: "SewersViewController")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SewersViewController
        vc.self.selectedClothes = selectedClothes
    }
}
