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
//        var clothItem : ClothItem = ClothItem(cloth_id: 0, icon: UIImage(named: "")!, title: "", selected: false)
//        
//        for (index, cloth) in clothsList.enumerated() {
//            
//            print(cloth)
//            
////            if indexPath.section == index {
////                clothItem = cloth[indexPath.row]
////            }
//        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClothItemViewCell") as! ClothItemViewCell
        cell.setData(icon: UIImage(named: "robe")!, label: "Robe")
        
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
}
