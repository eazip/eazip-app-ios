//
//  ReviewViewCell.swift
//  Eazip
//
//  Created by Marie on 27/03/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class ReviewViewCell: UICollectionViewCell {
    @IBOutlet weak var reviewTextContent: UILabel!
    @IBOutlet weak var reviewAuthor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let borderColor : UIColor = UIColor(named: "borderLightGrey")!
        self.layer.masksToBounds = false
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.layer.borderColor = borderColor.cgColor
        reviewAuthor.font = FontHelper.avenirBlackFontWithSize(size: 13)
    }
    
    func setData() {
        reviewTextContent.text = "Haec igitur prima lex amicitiae sanciatur, ut ab amicis honesta petamus, amicorum causa honesta faciamus. Ut ab amicis honesta petamus, amicorum causa honesta faciamus"
        reviewAuthor.text = "Minouce (23 avis)"
    }
}