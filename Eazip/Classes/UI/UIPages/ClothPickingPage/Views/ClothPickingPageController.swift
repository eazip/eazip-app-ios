//
//  ClothPickingListScreen.swift
//  Eazip
//
//  Created by Quentin Michalet on 29/01/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class ClothPickingListScreen: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var validationButton: UIButton!
    @IBOutlet weak var clothPickingScreenTtitle: UILabel!
    
    @IBAction func checkboxTaped (_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
    var clothsList: [ClothItem] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clothsList = createArray()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        validationButton.layer.cornerRadius = 25
        validationButton.titleLabel?.font = FontHelper.avenirBlackFontWithSize(size: 20)

        clothPickingScreenTtitle.font = FontHelper.eazipDefaultBlackFontWithSize(size: 20)
        
    }
    
    func createArray() -> [ClothItem] {
        var tempClothList: [ClothItem] = []
        
        let clothItem1 = ClothItem(cloth_id: 1, icon: UIImage(named: "robe")!, title: "Robe", selected: false)
        let clothItem2 = ClothItem(cloth_id: 2, icon: UIImage(named: "pantalon")!, title: "Pantalon", selected: false)
        let clothItem3 = ClothItem(cloth_id: 3, icon: UIImage(named: "t-shirt")!, title: "T-shirt", selected: false)
        let clothItem4 = ClothItem(cloth_id: 4, icon: UIImage(named: "jupe")!, title: "Jupe", selected: false)
        let clothItem5 = ClothItem(cloth_id: 5, icon: UIImage(named: "chemise")!, title: "Chemise", selected: false)
        let clothItem6 = ClothItem(cloth_id: 6, icon: UIImage(named: "pullover")!, title: "Pullover", selected: false)
        let clothItem7 = ClothItem(cloth_id: 7, icon: UIImage(named: "col-roule")!, title: "Col roulé", selected: false)
        let clothItem8 = ClothItem(cloth_id: 8, icon: UIImage(named: "veste")!, title: "Veste", selected: false)
        let clothItem9 = ClothItem(cloth_id: 9, icon: UIImage(named: "manteau")!, title: "Manteau", selected: false)
        
        tempClothList.append(clothItem1)
        tempClothList.append(clothItem2)
        tempClothList.append(clothItem3)
        tempClothList.append(clothItem4)
        tempClothList.append(clothItem5)
        tempClothList.append(clothItem6)
        tempClothList.append(clothItem7)
        tempClothList.append(clothItem8)
        tempClothList.append(clothItem9)
        
        return tempClothList
    }
}

extension ClothPickingListScreen: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clothsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let clothItem = clothsList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClothPickingCell") as! ClothPickingCell
        
        cell.setClothItem(clothItem: clothItem)
        
        return cell
        
    }
}
