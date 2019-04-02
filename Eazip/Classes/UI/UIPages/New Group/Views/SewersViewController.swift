//
//  SewersViewController.swift
//  Eazip
//
//  Created by Marie on 29/01/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class SewersViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var sewerCollectionView : UICollectionView?
    
    var collectionView: UICollectionView?
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    var dataSewers : [Sewer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSewers = createSewersArray()
        
        //Screen properties
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.size.width
        screenHeight = screenSize.height
        
        //Layout content position
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: screenWidth / 2 , height: screenWidth / 2)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    
    func createSewersArray() -> [Sewer] {
        var sewerList : [Sewer] = []
        
        let sewer1 = Sewer(img: UIImage(named:"sewerPicture1")!, name: "Amélie", rank: "4,5/5", works: "20")
        let sewer2 = Sewer(img: UIImage(named:"sewerPicture2")!, name: "Joseph", rank: "4,5/5", works: "20")
        let sewer3 = Sewer(img: UIImage(named:"sewerPicture3")!, name: "Nina", rank: "4,5/5", works: "20")
        let sewer4 = Sewer(img: UIImage(named:"sewerPicture1")!, name: "Alice", rank: "4,5/5", works: "20")
        let sewer5 = Sewer(img: UIImage(named:"sewerPicture2")!, name: "Pierre-Emanuel", rank: "4,0/5", works: "20")
        let sewer6 = Sewer(img: UIImage(named:"sewerPicture3")!, name: "Julie", rank: "4,5/5", works: "20")
        
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
    
    func collectionView(_ collectionView: UICollectionView, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sewerCell = collectionView.dequeueReusableCell(withReuseIdentifier: SewerViewCell.identifier, for: indexPath as IndexPath) as! SewerViewCell
        
        sewerCell.sewerNameLabel.text = dataSewers[indexPath.item].sewerName
        sewerCell.sewerRankLabel.text = dataSewers[indexPath.item].sewerRank
        sewerCell.sewerWorksNbLabel.text = dataSewers[indexPath.item].sewerWorksNb + " prestations"
        sewerCell.sewerPicture.image = dataSewers[indexPath.item].sewerPicture
        
        return sewerCell
    }
}



