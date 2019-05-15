//
//  ClothsListTableView.swift
//  Eazip
//
//  Created by Marie on 11/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

extension ClothsPickingViewController : UITableViewDataSource, UITableViewDelegate {
    
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
        cell.setData(icon: clothItem.icon, label: clothItem.title)
    
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
            cell.addOne()
            cell.updateCountLabel()
            
            var selectedClothesCount : Int = 0
            for (index, clothe) in selectedClothes.enumerated() {
                let keyExists = clothe["itemID"] != nil
                if keyExists {
                    let clotheID = clothe["itemID"] as! Int
                    if clotheID == cell.getItemID() {
                        selectedClothesCount += 1
                        selectedClothes[index]["count"] = cell.getCount()
                    }
                }
            }
            if selectedClothesCount == 0 {
                selectedClothes.append(["itemID" : cell.getItemID(), "count": cell.getCount()])
            }
            toggleNavigationAvailability()
        }
    }
}
