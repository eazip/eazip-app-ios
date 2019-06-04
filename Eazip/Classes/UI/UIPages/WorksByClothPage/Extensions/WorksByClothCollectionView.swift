//
//  WorksByClothCollectionView.swift
//  Eazip
//
//  Created by Marie on 12/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

extension WorksByClothViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate, ExpandableDropdownDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        var sectionCount: Int = 0
        
        for cloth in selectedClothes {
            let clothCount = cloth["count"] as! Int
            
            sectionCount = sectionCount + clothCount
            
        }
        return selectedClothes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorksDropdownItemViewCell", for: indexPath as IndexPath) as! WorksDropdownItemViewCell
        cell.setData()
        cell.indexPath = indexPath
        cell.delegate = self
        
        if  expandableDropdownStatesByClothe.count > 0 &&  expandableDropdownStatesByClothe[indexPath.section][indexPath.row] == notExpandedHeight {
            cell.tableState = false
        } else {
            cell.tableState = true
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = CGSize(width: collectionView.bounds.width, height: 80)
        
        if expandableDropdownStatesByClothe.count > 0 {
            return CGSize(width: collectionView.bounds.width, height: expandableDropdownStatesByClothe[indexPath.section][indexPath.row])
        }
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let sectionTitle = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ClothHeaderReusableView", for: indexPath) as! ClothHeaderReusableView
        
        sectionTitle.setData(clotheLabel: selectedClothes[indexPath.section]["clothLabel"] as! String, clotheIcon: getClothImage(label: selectedClothes[indexPath.section]["clothLabel"] as! String))
        
        return sectionTitle
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
    
    func openerButtonTouched(indexPath: IndexPath, size: CGFloat) {
        if (expandableDropdownStatesByClothe.count > 0) {
            expandableDropdownStatesByClothe[indexPath.section][indexPath.row] = size
            UIView.animate(withDuration: 0.8, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.worksDropDownCollectionView?.reloadItems(at: [indexPath])
            })
        }
    }
}
