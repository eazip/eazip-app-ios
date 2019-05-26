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
        var tempClothList: [ClothItem] = []
        
            if let url = URL(string: "http://ec2-35-180-118-48.eu-west-3.compute.amazonaws.com/clothes") {
                let session = URLSession.shared
                session.dataTask(with: url) { (data, response, error) in
        
                    if let data = data {
                        do {
                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                                if let clothArray = json["data"] as? NSArray {
                                    for cloth in clothArray as! [Dictionary<String, AnyObject>] {
                                        let id = cloth["id"] as! Int
                                        let label = cloth["label"] as! String
                                        tempClothList.append(ClothItem(cloth_id: id, icon: UIImage(named: "robe")!, title: label, selected: false))
                                    }
                                }
                            }
        
                        } catch {
                            print(error)
                        }
                    }
                    
                }.resume()
            }
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
