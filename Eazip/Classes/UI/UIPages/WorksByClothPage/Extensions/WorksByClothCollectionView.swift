//
//  WorksByClothCollectionView.swift
//  Eazip
//
//  Created by Marie on 12/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

extension WorksByClothViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return clothProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let clothItem = clothProducts[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClothDetailsViewCell", for: indexPath as IndexPath) as! ClothDetailsViewCell
        cell.setData(icon: clothItem.icon, label: clothItem.title)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: UIScreen.main.bounds.size.width, height: 70)
    }
}
