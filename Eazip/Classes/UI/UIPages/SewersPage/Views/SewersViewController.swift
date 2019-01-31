//
//  SewersViewController.swift
//  Eazip
//
//  Created by Marie on 29/01/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class SewersViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView?
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    var dataSewers : [Sewer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSewers = createSewersArray()
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.size.width - 10
        screenHeight = screenSize.height
    }
    
    func createSewersArray() -> [Sewer] {
        var sewerList : [Sewer] = []
        
        let sewer1 = Sewer(img: UIImage(named:"sewerPicture1")!, name: "Amélie", rank: "4,5/5")
        let sewer2 = Sewer(img: UIImage(named:"sewerPicture2")!, name: "Joseph", rank: "4,5/5")
        let sewer3 = Sewer(img: UIImage(named:"sewerPicture3")!, name: "Nina", rank: "4,5/5")
        let sewer4 = Sewer(img: UIImage(named:"sewerPicture4")!, name: "Alice", rank: "4,5/5")
        let sewer5 = Sewer(img: UIImage(named:"sewerPicture5")!, name: "Jean-Paul", rank: "4,0/5")
        let sewer6 = Sewer(img: UIImage(named:"sewerPicture6")!, name: "Julie", rank: "4,5/5")
        
        sewerList.append(sewer1)
        sewerList.append(sewer2)
        sewerList.append(sewer3)
        sewerList.append(sewer4)
        sewerList.append(sewer5)
        sewerList.append(sewer6)
        
        return sewerList
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSewers.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sewerCell = collectionView.dequeueReusableCell(withReuseIdentifier: SewerViewCell.identifier, for: indexPath as IndexPath) as! SewerViewCell
        //sewerCell.backgroundColor = UIColor.cyan
        sewerCell.frame.size = CGSize(width: screenWidth/2, height: screenWidth/2 + 20)
        sewerCell.sewerNameLabel.text = dataSewers[indexPath.item].sewerName
        sewerCell.sewerRankLabel.text = dataSewers[indexPath.item].sewerRank
        sewerCell.sewerPicture.image = dataSewers[indexPath.item].sewerPicture
        return sewerCell
        
    }


}


