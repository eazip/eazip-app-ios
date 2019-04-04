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
    
    var clothsList: [ClothItem] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clothsList = createArray()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func createArray() -> [ClothItem] {
        var tempClothList: [ClothItem] = []
        
        let clothItem1 = ClothItem(icon: UIImage(named: "robe")!, title: "Robe")
        let clothItem2 = ClothItem(icon: UIImage(named: "pantalon")!, title: "Pantalon")
        let clothItem3 = ClothItem(icon: UIImage(named: "t-shirt")!, title: "T-shirt")
        let clothItem4 = ClothItem(icon: UIImage(named: "jupe")!, title: "Jupe")
        let clothItem5 = ClothItem(icon: UIImage(named: "chemise")!, title: "Chemise")
        let clothItem6 = ClothItem(icon: UIImage(named: "pullover")!, title: "Pullover")
        let clothItem7 = ClothItem(icon: UIImage(named: "col-roule")!, title: "Col roulé")
        let clothItem8 = ClothItem(icon: UIImage(named: "veste")!, title: "Veste")
        let clothItem9 = ClothItem(icon: UIImage(named: "manteau")!, title: "Manteau")
        
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
