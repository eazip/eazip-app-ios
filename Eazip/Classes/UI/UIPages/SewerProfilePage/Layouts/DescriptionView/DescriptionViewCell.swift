//
//  DescriptionViewCell.swift
//  Eazip
//
//  Created by Marie on 27/03/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class DescriptionViewCell: UICollectionViewCell {
    
    @IBOutlet var descriptionTitle : UILabel?
    @IBOutlet var descriptionContent : UILabel?
    @IBOutlet var showAvailabilityBtn : ColoredActionButton?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(biography: String) {
        descriptionTitle?.text = "Description"
        descriptionContent?.text = biography
        showAvailabilityBtn?.setTitle("Voir ses disponibilités", for: .normal)
    }

}
