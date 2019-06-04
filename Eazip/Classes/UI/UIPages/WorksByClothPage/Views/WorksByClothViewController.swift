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
    
    var selectedClothes: [[String: Any]] = []
    
//    let selectedClothes = ["Robe", "Robe"]
    var navigationAllowed : Bool = true
    var selectedServices : [[String : Any]] = []
    var expandableDropdownStatesByClothe : [[CGFloat]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHeaderView()
        initWorksDropDownCollectionView()
        worksDropDownCollectionView.layoutIfNeeded()
        setUpValidationButton()
        toggleNavigationAvailability()
        print("TEST DATA", selectedClothes)
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
        validationButton?.isHidden = true
    }
    
    func makeNextStepAvailable() {
        navigationAllowed = true
        validationButton?.isHidden = false
    }
    
    @IBAction func next(_ sender: Any) {
        nextStep()
    }
    
    func nextStep() -> Void {
        if navigationAllowed {
            goToScreen(identifier: "SewersViewController")
        }
    }
}
