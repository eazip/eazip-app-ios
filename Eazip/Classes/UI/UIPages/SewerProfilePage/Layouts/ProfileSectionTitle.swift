//
//  sectionProfileTitle.swift
//  Eazip
//
//  Created by Marie on 29/03/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class ProfileSectionTitle : UICollectionReusableView {
    @IBOutlet weak var titleLabel : UILabel!
    
    func setData() {
        titleLabel.text = "Avis (2)"
    }
}
