//
//  ClothDetailsViewCell.swift
//  Eazip
//
//  Created by Marie on 12/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class ClothDetailsViewCell: UICollectionViewCell,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {

    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    
    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var clothTitleWrapper: UIView!
    @IBOutlet weak var clothIcon: UIImageView!
    @IBOutlet weak var clothLabel: UILabel!
    @IBOutlet weak var worksDropDownCollectionView: UICollectionView!
    
    // Main Colors
    let wrapperBackgroundColor : UIColor = UIColor(named: "backgroundLightGrey")!
    
    /**
     /////////////////////
     Up
     /////////////////////
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        initWorksDropDownCollectionView()
        worksDropDownCollectionView.layoutIfNeeded()
        self.collectionHeight?.constant = worksDropDownCollectionView.contentSize.height * 1.2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        worksDropDownCollectionView.layoutIfNeeded()
        wrapperView.layoutIfNeeded()
        
        print(wrapperView.heightAnchor)
        print(clothTitleWrapper.heightAnchor)
        print(worksDropDownCollectionView.heightAnchor)
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        
        return layoutAttributes
    }
    
    func initWorksDropDownCollectionView() {
        //Init cell
        initDropDownItemViewCell(cellIdentifier: "WorksDropdownItemViewCell")
        
        //Init delegate and datasource
        worksDropDownCollectionView?.delegate = self
        worksDropDownCollectionView?.dataSource = self
        worksDropDownCollectionView.isScrollEnabled = false
        
        //Layout content position
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.itemSize = UICollectionViewFlowLayoutAutomaticSize
        layout.estimatedItemSize = CGSize(width: 1, height:1)
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        
        worksDropDownCollectionView?.collectionViewLayout = layout
    }
    
    func initDropDownItemViewCell(cellIdentifier: String) {
        worksDropDownCollectionView?.register(UINib(nibName:cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }
    
    func setData(icon: UIImage, label: String) {
        clothIcon.image = icon
        clothLabel.text = label
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorksDropdownItemViewCell", for: indexPath as IndexPath) as! WorksDropdownItemViewCell
        cell.setData()
        
        return cell
    }
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: worksDropDownCollectionView.bounds.width, height: 70)
    }
    
    private func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAtt indexPath: IndexPath) {
        self.layoutIfNeeded()
    }
}
