//
//  SewerViewCell.swift
//  Eazip
//
//  Created by Marie on 30/01/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class SewerViewCell: UICollectionViewCell {
    
    static let identifier = "SewerViewCell"
    
    @IBOutlet weak var sewerNameLabel: UILabel!
    @IBOutlet weak var sewerRankLabel: UILabel!
    @IBOutlet weak var sewerWorksNbLabel: UILabel!
    @IBOutlet weak var sewerPicture: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.frame = UIEdgeInsetsInsetRect(contentView.frame, UIEdgeInsetsMake(0, 0, 0, 0))
        setUpSewerPicture()
        setUpSewerName()
        setupSewerWorksNb()
        setupSewerRank()
    }
    
    func setUpSewerPicture() {
        sewerPicture.layer.cornerRadius = 5
        sewerPicture.layer.masksToBounds = true
    }
    
    func setUpSewerName() {
        sewerNameLabel.font = FontHelper.eazipDefaultBlackFontWithSize(size: 20)
        sewerNameLabel.textAlignment = .left
        sewerNameLabel.numberOfLines = 0
        sewerNameLabel.lineBreakMode = .byWordWrapping
        sewerNameLabel.sizeToFit()
    }
    
    func setupSewerWorksNb() {
        sewerWorksNbLabel.font = FontHelper.avenirBookFontWithSize(size: 14)
    }
    
    func setupSewerRank() {
        sewerRankLabel.font = FontHelper.eazipDefaultBlackFontWithSize(size: 14)
    }

}
