//
//  SewersViewController.swift
//  Eazip
//
//  Created by Marie on 29/01/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class SewersViewController: UIViewController {
    
    @IBOutlet var sewerCollectionView : UICollectionView?
    
    var collectionView: UICollectionView?
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    var dataSewers : [Sewer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSewers = createSewersArray()
        initSewerCollectionView()
    }
    
    func createSewersArray() -> [Sewer] {
        var sewerList : [Sewer] = []
        
        let sewer1 = Sewer(img: UIImage(named:"sewerPicture1")!, name: "Amélie", rating: 4, works: 3)
        let sewer2 = Sewer(img: UIImage(named:"sewerPicture2")!, name: "Joseph", rating: 4, works: 10)
        let sewer3 = Sewer(img: UIImage(named:"sewerPicture3")!, name: "Nina", rating: 4, works: 18)
        let sewer4 = Sewer(img: UIImage(named:"sewerPicture1")!, name: "Alice", rating: 4, works: 34)
        let sewer5 = Sewer(img: UIImage(named:"sewerPicture2")!, name: "Pierre-Emanuel", rating: 4, works: 19)
        let sewer6 = Sewer(img: UIImage(named:"sewerPicture3")!, name: "Julie", rating: 4, works: 43)
        
        sewerList.append(sewer1)
        sewerList.append(sewer2)
        sewerList.append(sewer3)
        sewerList.append(sewer4)
        sewerList.append(sewer5)
        sewerList.append(sewer6)
        
        return sewerList
    }
    
    func initSewerCollectionView() {
        //Init delegate and datasource
        sewerCollectionView?.delegate = self
        sewerCollectionView?.dataSource =  self
        
        //Layout content position
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 30
        sewerCollectionView?.collectionViewLayout = layout
    }
}



