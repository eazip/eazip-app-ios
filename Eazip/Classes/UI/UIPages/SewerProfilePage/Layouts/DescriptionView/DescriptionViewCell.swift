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
    
    func setData() {
        descriptionTitle?.text = "Description"
        descriptionContent?.text = "Denique Antiochensis ordinis vertices sub uno elogio iussit occidi ideo efferatus, quod ei celebrari vilitatem intempestivam urgenti, cum inpenderet inopia, gravius rationabili responderunt; et perissent ad unum ni comes orientis tunc Honoratus fixa constantia restitisset."
        showAvailabilityBtn?.setTitle("Voir ses disponibilités", for: .normal)
    }

}
