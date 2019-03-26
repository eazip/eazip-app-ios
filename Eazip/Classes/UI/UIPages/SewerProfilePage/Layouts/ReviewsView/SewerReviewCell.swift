//
//  SewerReviewCell.swift
//  Eazip
//
//  Created by Marie on 24/03/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class SewerReviewCell: UITableViewCell {
    
    @IBOutlet weak var reviewTextContent: UILabel!
    @IBOutlet weak var reviewAuthor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        contentView.frame = UIEdgeInsetsInsetRect(contentView.frame, UIEdgeInsetsMake(0, 0, 0, 0))
        let borderColor : UIColor = UIColor(named: "borderLightGrey")!
        self.layer.masksToBounds = false
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.layer.borderColor = borderColor.cgColor
        reviewAuthor.font = FontHelper.avenirBlackFontWithSize(size: 13)
    }
}

