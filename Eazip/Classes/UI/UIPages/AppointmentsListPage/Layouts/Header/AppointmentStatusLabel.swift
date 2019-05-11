//
//  AppointmentStatusLabel.swift
//  Eazip
//
//  Created by Marie on 02/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class AppointmentStatusLabel : UICollectionReusableView {
    @IBOutlet weak var titleLabel : UILabel!
    
    func setData(label: String) {
        titleLabel.text = label
        titleLabel.font = FontHelper.eazipDefaultBlackFontWithSize(size: 15)
    }
}
