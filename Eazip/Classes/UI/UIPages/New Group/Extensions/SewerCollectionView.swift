//
//  SewerCollectionView.swift
//  Eazip
//
//  Created by Marie on 17/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

extension SewersViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSewers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sewerCell = collectionView.dequeueReusableCell(withReuseIdentifier: SewerViewCell.identifier, for: indexPath as IndexPath) as! SewerViewCell
        let item = dataSewers[indexPath.row]
        
        sewerCell.setData(name: item.sewerName, rating: item.sewerRating, worksNb: item.sewerWorksNb, picture: item.sewerPicture)
        
        return sewerCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width : CGFloat = 0
        if sewerCollectionView!.bounds.width < CGFloat(400) {
            width = (sewerCollectionView!.bounds.width - 13) / 2
        } else {
            width = 153
        }

       return CGSize(width: width, height: 206)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        goToScreen(identifier: "SewerProfileViewController")
    }
}
