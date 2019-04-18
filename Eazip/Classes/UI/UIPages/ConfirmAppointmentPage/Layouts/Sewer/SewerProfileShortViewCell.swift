//
//  SewerProfileShortViewCell.swift
//  Eazip
//
//  Created by Marie on 18/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class SewerProfileShortViewCell: UICollectionViewCell, ConfigurableCell {
    @IBOutlet weak var sewerPicture: UIImageView!
    @IBOutlet weak var shortProfileContentView: UIView!
    @IBOutlet weak var sewerName: UILabel!
    @IBOutlet weak var sewerPrestations: UILabel!
    @IBOutlet weak var sewerRating: UILabel!

    // Main cell colors
    let unvailableCellBackgroundColor : UIColor = UIColor(named: "backgroundLightGrey")!
    let unvailableCellTextColor : UIColor = UIColor(named: "lightGrey")!
    
    var availableCell : Bool = true
        
    /**
     /////////////////////
     Up
     /////////////////////
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpSewerPicture()
    }
    
    override func layoutSubviews() {
        
    }
    
    func setUpSewerPicture() {
        sewerPicture.layer.cornerRadius = 5
        sewerPicture.layer.masksToBounds = true
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
    
    override func prepareForReuse() {
        super.prepareForReuse()

    }
    
    func configure(data test: Int) {
//        let rating : String = String(describing: personal["rating"] as? Int ?? 0)
//        sewerPicture.image = personal["picture"] as? UIImage
//        sewerName.text = personal["name"] as? String
//        sewerRating.text = rating + "/5"
        
        sewerPicture.image = UIImage(named:"sewerPicture1")
        sewerName.text = "Alice Moneroe"
        sewerRating.text = "4/5"
        sewerPrestations.text = "23 prestations"
    }

}
