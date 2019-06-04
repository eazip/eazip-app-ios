//
//  PictureViewCell.swift
//  Eazip
//
//  Created by Marie on 26/03/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit
import Cosmos

class PictureViewCell: UICollectionViewCell, ConfigurableCell {
    @IBOutlet weak var sewerPictureView: UIImageView!
    @IBOutlet weak var sewerName: UILabel!
    @IBOutlet weak var sewerRating: UILabel!
    @IBOutlet weak var ratingBis: LightLabel!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var starsField: CosmosView!
    
    let gradient: CAGradientLayer = CAGradientLayer()

    override func awakeFromNib() {
        super.awakeFromNib()
        sewerName?.font = FontHelper.eazipDefaultBlackFontWithSize(size: 30)
        sewerName?.textColor = UIColor.white
        ratingBis.font = FontHelper.avenirBookFontWithSize(size: 14)
        
        //Picture gradient properties
        gradientView.backgroundColor = UIColor.clear
    
        //Picture gradient properties
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.8).cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientView.layer.addSublayer(gradient)
 
        //Set data to front view
        gradientView.addSubview(sewerName!)
        gradientView.addSubview(sewerRating!)
        gradientView.bringSubview(toFront: sewerName!)
        gradientView.bringSubview(toFront: sewerRating!)
        gradientView.bringSubview(toFront: ratingBis!)
        gradientView.bringSubview(toFront: starsField!)
        
        //Data constraints
        sewerName?.bottomAnchor.constraint(equalTo: sewerPictureView.bottomAnchor, constant: -45).isActive = true
        sewerRating?.bottomAnchor.constraint(equalTo: sewerPictureView.bottomAnchor, constant: -15).isActive = true
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds
    }
    
    func configure(data personal: [String : Any]) {
        let rating : String = String(describing: personal["rating"] as? Int ?? 0)
        sewerPictureView.image = personal["picture"] as? UIImage
        sewerName.text = personal["name"] as? String
        sewerRating.text = rating
        ratingBis.text = ".0"
    }
}
