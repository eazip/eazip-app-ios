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

    override func awakeFromNib() {
        super.awakeFromNib()
        
        sewerName?.font = FontHelper.eazipDefaultBlackFontWithSize(size: 30)
        sewerName?.textColor = UIColor.white
        
        //Picture gradient properties
        let gradientView = UIView(frame: sewerPictureView.frame)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        sewerPictureView.addSubview(gradientView)
        sewerPictureView.bringSubview(toFront: gradientView)
        gradientView.frame.size.width = self.frame.size.width
        
        //Picture gradient properties
        let gradient = CAGradientLayer()
        gradient.frame = gradientView.frame
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0, 1.0]
        
        gradientView.layer.insertSublayer(gradient, at: 0)
        
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
