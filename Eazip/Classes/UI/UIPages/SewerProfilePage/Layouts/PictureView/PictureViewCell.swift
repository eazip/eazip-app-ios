//
//  PictureViewCell.swift
//  Eazip
//
//  Created by Marie on 26/03/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class PictureViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sewerPictureView: UIImageView!
    @IBOutlet weak var sewerName: UILabel!
    @IBOutlet weak var sewerRating: UILabel!
    @IBOutlet weak var gradientView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        sewerName?.font = FontHelper.eazipDefaultBlackFontWithSize(size: 30)
        sewerName?.textColor = UIColor.white
        
        //Picture gradient properties
        gradientView.backgroundColor = UIColor.clear
        //gradientView.backgroundColor = UIColor.blue
        
        //Picture gradient properties
        let gradient = CAGradientLayer()
        gradient.frame = gradientView.frame
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0, 1.0]
        gradientView.layer.addSublayer(gradient)
        gradient.frame = gradientView.bounds
        
        //Set data to front view
        gradientView.addSubview(sewerName!)
        gradientView.addSubview(sewerRating!)
        gradientView.bringSubview(toFront: sewerName!)
        gradientView.bringSubview(toFront: sewerRating!)
        
        //Data constraints
        sewerName?.bottomAnchor.constraint(equalTo: sewerPictureView.bottomAnchor, constant: -45).isActive = true
        sewerRating?.bottomAnchor.constraint(equalTo: sewerPictureView.bottomAnchor, constant: -15).isActive = true
    }
    
    func setData() {
        sewerPictureView.image = UIImage(named:"sewerPicture2")
        sewerName.text = "Milouce"
        sewerRating.text = String(4) + ".0"
    }

}
