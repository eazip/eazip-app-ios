//
//  ClothPickingCell.swift
//  Eazip
//
//  Created by Quentin Michalet on 29/01/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class ClothPickingCell: UITableViewCell {
    
    @IBOutlet weak var clothPickingIconView: UIImageView!
    @IBOutlet weak var clothPickingTitleLabel: UILabel!
    
    func setClothItem(clothItem: ClothItem) {
        clothPickingIconView.image = clothItem.icon
        clothPickingTitleLabel.text = clothItem.title
    }
}
