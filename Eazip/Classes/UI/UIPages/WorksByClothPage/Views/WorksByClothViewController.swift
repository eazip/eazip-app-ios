//
//  WorksByClothViewController.swift
//  Eazip
//
//  Created by Marie on 11/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class WorksByClothViewController: UIViewController {

    @IBOutlet weak var worksByClothCollectionView: UICollectionView!
    @IBOutlet weak var validationButton: ColoredActionButton!
    
    let clothProducts : [ClothItem] = [ClothItem(cloth_id: 1, icon: UIImage(named: "robe")!, title: "Robe", selected: false), ClothItem(cloth_id: 1, icon: UIImage(named: "robe")!, title: "Robe", selected: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initWorksByClothCollectionView()
    }
    
    func initWorksByClothCollectionView() {
        //Init cell
        setUpClothView()
        
        //Init delegate and datasource
        worksByClothCollectionView?.delegate = self
        worksByClothCollectionView?.dataSource =  self
        
        //Layout content position
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.itemSize = UICollectionViewFlowLayoutAutomaticSize
        layout.estimatedItemSize = CGSize(width: 1, height:1)
        
        worksByClothCollectionView?.collectionViewLayout = layout
    }

    func setUpClothView() {
        initClothSectionCell(cellIdentifier: "ClothDetailsViewCell")
    }
    
    func initClothSectionCell(cellIdentifier: String) {
        worksByClothCollectionView?.register(UINib(nibName:cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }
}
