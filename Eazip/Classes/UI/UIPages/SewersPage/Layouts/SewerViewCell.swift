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
    @IBOutlet weak var sewerPicture: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.frame = UIEdgeInsetsInsetRect(contentView.frame, UIEdgeInsetsMake(0, 0, 0, 0))
        sewerPicture.layer.cornerRadius = 20
    }

}
