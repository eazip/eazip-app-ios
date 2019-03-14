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
        sewerPicture.layer.cornerRadius = 5
        sewerPicture.layer.masksToBounds = true
        sewerNameLabel.textAlignment = .left
        
        let sewerNameWidth : CGFloat = sewerPicture.bounds.width * 0.6
        sewerNameLabel.frame.size.width = sewerNameWidth
        sewerNameLabel.numberOfLines = 0
        sewerNameLabel.lineBreakMode = .byWordWrapping
        sewerNameLabel.sizeToFit()
        sewerRankLabel.font = FontHelper.eazipDefaultBlackFontWithSize(size: 14)
        sewerWorksNbLabel.font = FontHelper.avenirBookFontWithSize(size: 14)
    
        if (sewerNameLabel.text?.count ?? 0 > 6) {
            sewerNameLabel.font = FontHelper.eazipDefaultBlackFontWithSize(size: 15)
        } else {
            sewerNameLabel.font = FontHelper.eazipDefaultBlackFontWithSize(size: 20)
        }
    }

}
