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
    @IBOutlet weak var tableViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var validationButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var headerviewLabel: EazipLabel!
    
    var clothsList: [ClothItem] = []
    var navigationAllowed : Bool = false
    var selectedClothes : [[String: Any]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHeaderView()
        getCloths()
        setUpValidationButton()
        makeNextStepUnavailable()
    }
    
    func setUpHeaderView() {
        headerviewLabel.textAlignment = .center
        headerviewLabel.text = "Choisissez vos" + "\n" + "vêtements à retoucher"
    }
    
    func getCloths() {
        ApiClothsHelper() { clothList, error in
            if clothList != nil {
                self.clothsList.append(contentsOf: clothList!)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self.initClothsTableView()
                }
            }
        }
    }
    
    typealias Apicompletion = (_ clothList: [ClothItem]?, _ errorString: String?) -> Void
    
    func ApiClothsHelper(completion: Apicompletion?) {
        let url = URL(string: "http://ec2-35-180-118-48.eu-west-3.compute.amazonaws.com/clothes")
        let session = URLSession.shared
        
        session.dataTask(with: url!) { (data, response, error) in
            var tempClothlist: [ClothItem] = []
            
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        if let clothArray = json["data"] as? NSArray {
                            for cloth in clothArray as! [Dictionary<String, AnyObject>] {
                                let id = cloth["id"] as! Int
                                let label = cloth["label"] as! String
                                
                                tempClothlist.append(ClothItem(cloth_id: id, icon: UIImage(named: self.getClothImage(label: label))!, title: label, selected: false))
                            }
                            completion?(tempClothlist, nil)
                        }
                    }
                } catch {
                    completion?(nil, error.localizedDescription)
                }
            }
        }.resume()
        
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
    
    func initClothsTableView() {
        //Init cell
        initCLothItemCell(cellIdentifier: "ClothItemViewCell")
        
        //Init delegate and datasource
        clothsTableView?.estimatedRowHeight = 80
        clothsTableView?.sectionHeaderHeight = 12
        clothsTableView?.rowHeight = UITableViewAutomaticDimension
        clothsTableView?.separatorStyle = .none
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
        updateBottomConstraints()
    }
    
    func makeNextStepAvailable() {
        navigationAllowed = true
        validationButton.isHidden = false
        updateBottomConstraints()
    }
    
    func updateBottomConstraints() {
        if  !validationButton.isHidden {
            tableViewBottomConstraint.constant = validationButtonHeight.constant * 1.5
        } else {
            tableViewBottomConstraint.constant = 0
        }
    }
    
    @IBAction func next(_ sender: Any) {
        performSegue(withIdentifier: "selectedClothesSegue", sender: self)
        nextStep()
    }
    
    func nextStep() -> Void {
        if navigationAllowed {
            goToScreen(identifier: "WorksByClothViewController")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! WorksByClothViewController
        vc.self.selectedClothes = selectedClothes
    }
}
