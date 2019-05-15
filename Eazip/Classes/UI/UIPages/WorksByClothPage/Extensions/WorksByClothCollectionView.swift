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
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClothDetailsViewCell", for: indexPath as IndexPath) as! ClothDetailsViewCell
        cell.setData(icon: UIImage(named:"robe")!, label: "Robe")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: worksByClothCollectionView.bounds.width, height: 70)
    }
    
    private func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAtt indexPath: IndexPath) {
        self.loadViewIfNeeded()
    }
}
