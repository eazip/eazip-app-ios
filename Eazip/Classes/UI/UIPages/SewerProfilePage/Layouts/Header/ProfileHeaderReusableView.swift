//
//  ProfileHeaderReusableView.swift
//  Eazip
//
//  Created by Marie on 03/06/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class ProfileHeaderReusableView: UICollectionReusableView {
    @IBOutlet weak var titleLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(reviewsCount: Int) {
        titleLabel.text = "Avis (" + String(reviewsCount) + ")"
    }
    
}
