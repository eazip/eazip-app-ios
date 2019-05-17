//
//  ClothPickingListScreen.swift
//  Eazip
//
//  Created by Quentin Michalet on 29/01/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class ClothsPickingViewController: UIViewController {
    
    @IBOutlet weak var clothsTableView: UITableView!
    @IBOutlet weak var validationButton: UIButton!
    @IBOutlet weak var clothsPickingScreenTitle: UILabel!
    
    var clothsList: [ClothItem] = []
    var navigationAllowed : Bool = false
    var selectedClothes : [[String: Any]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        clothsList = createArray()
        setUpTitleScreen()
        initClothsTableView()
        setUpValidationButton()
        makeNextStepUnavailable()
    }
    
    func createArray() -> [ClothItem] {
        
        if let url = URL(string: "http://ec2-35-180-118-48.eu-west-3.compute.amazonaws.com/clothes") {
            print("La condition est vrai")
            let session = URLSession.shared
            session.dataTask(with: url) { (data, response, error) in
                
                if let response = response {
                    print("response", response)
                }
                
                if let data = data {
                    print("data", data)
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print("JSON", json)
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
        
        
        var tempClothList: [ClothItem] = []
        
        tempClothList.append(ClothItem(cloth_id: 1, icon: UIImage(named: "robe")!, title: "Robe", selected: false))
        tempClothList.append(ClothItem(cloth_id: 2, icon: UIImage(named: "pantalon")!, title: "Pantalon", selected: false))
        tempClothList.append(ClothItem(cloth_id: 3, icon: UIImage(named: "t-shirt")!, title: "T-shirt", selected: false))
        tempClothList.append(ClothItem(cloth_id: 4, icon: UIImage(named: "jupe")!, title: "Jupe", selected: false))
        tempClothList.append(ClothItem(cloth_id: 5, icon: UIImage(named: "chemise")!, title: "Chemise", selected: false))
        tempClothList.append(ClothItem(cloth_id: 6, icon: UIImage(named: "pullover")!, title: "Pullover", selected: false))
        tempClothList.append(ClothItem(cloth_id: 7, icon: UIImage(named: "col-roule")!, title: "Col roulé", selected: false))
        tempClothList.append(ClothItem(cloth_id: 8, icon: UIImage(named: "veste")!, title: "Veste", selected: false))
        tempClothList.append(ClothItem(cloth_id: 9, icon: UIImage(named: "manteau")!, title: "Manteau", selected: false))
    
        return tempClothList
    }
    
    func setUpTitleScreen() {
        clothsPickingScreenTitle.text = "Choisissez vos vêtements à retoucher"
        clothsPickingScreenTitle.textColor = UIColor(named: "lightGrey")
        clothsPickingScreenTitle.textAlignment = .center
    }
    
    func initClothsTableView() {
        //Init cell
        initCLothItemCell(cellIdentifier: "ClothItemViewCell")
        
        //Init delegate and datasource
        clothsTableView?.estimatedRowHeight = 80
        clothsTableView?.sectionHeaderHeight = 12
        clothsTableView?.rowHeight = UITableViewAutomaticDimension
        clothsTableView?.delegate = self
        clothsTableView?.dataSource = self
    }
    
    func initCLothItemCell(cellIdentifier: String) {
        clothsTableView?.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func setUpValidationButton() {
        validationButton?.setTitle("Valider", for: .normal)
    }
    
    func toggleNavigationAvailability() {
        if selectedClothes.count == 0 {
            makeNextStepUnavailable()
        } else {
            makeNextStepAvailable()
        }
    }
    
    func makeNextStepUnavailable() {
        navigationAllowed = false
        validationButton.isHidden = true
    }
    
    func makeNextStepAvailable() {
        navigationAllowed = true
        validationButton.isHidden = false
    }
    
    @IBAction func next(_ sender: Any) {
        nextStep()
    }
    
    func nextStep() -> Void {
        if navigationAllowed {
            goToScreen(identifier: "WorksByClothViewController")
        }
    }
}
