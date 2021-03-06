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
    @IBOutlet weak var reviewsNb: BoldLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
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
    
    func setUpUI() {
        let borderColor : UIColor = UIColor(named: "borderLightGrey")!
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.layer.borderColor = borderColor.cgColor
        reviewAuthor.font = FontHelper.avenirBlackFontWithSize(size: 13)
        reviewsNb.font = FontHelper.avenirBlackFontWithSize(size: 13)
    }
    
    func setData(rating: Int, textContent: String, author: String) {
        reviewTextContent.text = textContent
        reviewAuthor.text = author
        reviewsNb.text = "(23 avis)"
    }
}
