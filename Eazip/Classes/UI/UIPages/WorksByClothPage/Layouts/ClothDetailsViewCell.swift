//
//  ClothDetailsViewCell.swift
//  Eazip
//
//  Created by Marie on 12/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class ClothDetailsViewCell: UICollectionViewCell,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {

    @IBOutlet weak var clothTitleWrapper: UIView!
    @IBOutlet weak var clothIcon: UIImageView!
    @IBOutlet weak var clothLabel: UILabel!
    @IBOutlet weak var worksDropDownCollectionView: UICollectionView!
    
    var worksListsByCloth : [[[String: String]]] = []
    
    // Main Colors
    let wrapperBackgroundColor : UIColor = UIColor(named: "backgroundLightGrey")!
    
    /**
     /////////////////////
     Up
     /////////////////////
     */
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func initWorksDropDownCollectionView() {
        //Init cell
        initDropDownSectionSection()
        
        //Init delegate and datasource
        worksDropDownCollectionView?.delegate = self
        worksDropDownCollectionView?.dataSource =  self
        
        //Layout content position
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.itemSize = UICollectionViewFlowLayoutAutomaticSize
        layout.estimatedItemSize = CGSize(width: 1, height:1)
        
        worksDropDownCollectionView?.collectionViewLayout = layout
    }
    
    func initDropDownSectionSection() {
        initDropDownItemViewCell(cellIdentifier: "WorksDropdownItemViewCell")
    }
    
    func initDropDownItemViewCell(cellIdentifier: String) {
        worksDropDownCollectionView?.register(UINib(nibName:cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }
    
    func setData(icon: UIImage, label: String, worksLists: [[[String: String]]]) {
        clothIcon.image = icon
        clothLabel.text = label
        worksListsByCloth = worksLists
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return worksListsByCloth.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let worksListItem = worksListsByCloth[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorksDropdownItemViewCell", for: indexPath as IndexPath) as! WorksDropdownItemViewCell
        cell.setData(worksList: [[String: String]])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: 70)
    }
}
