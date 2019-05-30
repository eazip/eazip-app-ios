//
//  ClothHeaderReusableView.swift
//  Eazip
//
//  Created by Marie on 28/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class ClothHeaderReusableView: UICollectionReusableView {
    @IBOutlet weak var clotheImage: UIImageView!
    @IBOutlet weak var clotheTitleLabel: EazipLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(clotheLabel: String, clotheIcon: String) {
        clotheTitleLabel.text = clotheLabel
        clotheImage.image = UIImage(named: clotheIcon)
    }
}
