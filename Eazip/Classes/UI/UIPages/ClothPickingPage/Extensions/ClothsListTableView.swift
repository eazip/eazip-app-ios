//
//  ClothsListTableView.swift
//  Eazip
//
//  Created by Marie on 11/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

extension ClothsPickingViewController : UITableViewDataSource, UITableViewDelegate, ClothsPickingViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return clothsList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var clothItem : ClothItem = ClothItem(cloth_id: 0, icon: UIImage(named: "robe")!, title: "", selected: false)
        
        for (index, cloth) in clothsList.enumerated() {
            if indexPath.section == index {
                clothItem = cloth
            }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClothItemViewCell") as! ClothItemViewCell
        cell.delegate = self
        cell.setData(icon: clothItem.icon, label: clothItem.title, id: clothItem.cloth_id)
        
        for clothe in selectedClothes {
            let keyExists = clothe["itemID"] != nil
            if keyExists {
                let clotheID = clothe["itemID"] as! Int
                if clotheID == cell.getItemID() {
                    cell.setCount(countNb: clothe["count"] as! Int)
                }
            }
        }
        
        return cell
    }
    
    private func tableView(_ tableView: UITableView, sizeForRowAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: clothsTableView.frame.width, height:80)
        
        return size
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView.init(frame: CGRect.zero)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 12
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let isCell = tableView.cellForRow(at: indexPath) {
            let cell = isCell as! ClothItemViewCell
            cell.selectionStyle = .none
            increaseItem(from: cell)
        }
    }
    
    func didIncreaseCountButtonPressed(cell: ClothItemViewCell) {
        increaseItem(from: cell)
    }
    
    func didDecreaseCountButtonPressed(cell: ClothItemViewCell) {
        decreaseItem(from: cell)
    }
    
    func increaseItem(from cell: ClothItemViewCell) {
        cell.tapAnimation()
        cell.addOne()
        var itemsWithThisTypeSelected : Bool = false
        for (index, clothe) in selectedClothes.enumerated() {
            let keyExists = clothe["itemID"] != nil
            if keyExists {
                let clotheID = clothe["itemID"] as! Int
                if clotheID == cell.getItemID() {
                    itemsWithThisTypeSelected = true
                    updateClotheCountInSelectedClothes(at: index, count: cell.getCount())
                    break
                }
            }
        }
        if !itemsWithThisTypeSelected {
            addNewClotheObjectInSelectedClothes(clotheId: cell.getItemID(), clothLabel: cell.clothLabel.text!, clothIcon: cell.clothIcon)
        }
        toggleNavigationAvailability()
    }
    
    func decreaseItem(from cell: ClothItemViewCell) {
        cell.tapAnimation()
        cell.removeOne()
        for (index, clothe) in selectedClothes.enumerated() {
            if clothe["itemID"] as! Int == cell.getItemID() {
                let newClotheCount = cell.getCount()
                if newClotheCount == 0 {
                    removeClotheFromSelectedClothes(at: index)
                } else {
                    updateClotheCountInSelectedClothes(at: index, count: newClotheCount)
                }
            }
        }
        toggleNavigationAvailability()
    }
    
    func updateClotheCountInSelectedClothes(at index: Int, count: Int) {
        selectedClothes[index]["count"] = count
    }
    
    func removeClotheFromSelectedClothes(at index: Int) {
        selectedClothes.remove(at: index)
    }
    
    func addNewClotheObjectInSelectedClothes(clotheId: Int, clothLabel: String, clothIcon: UIImageView) {
        selectedClothes.append(["itemID" : clotheId, "count": 1, "clothLabel": clothLabel, "clothIcon": clothIcon])
    }
}
