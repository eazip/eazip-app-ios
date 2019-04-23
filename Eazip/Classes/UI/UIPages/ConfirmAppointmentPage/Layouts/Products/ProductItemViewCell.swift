//
//  ProductItemViewCell.swift
//  Eazip
//
//  Created by Marie on 22/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class ProductItemViewCell: UITableViewCell {
    
    @IBOutlet weak var quantityPriceLabel: DefaultText!
    @IBOutlet weak var productDescriptionLabel: DefaultText!
    
    /**
     /////////////////////
     Up
     /////////////////////
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        quantityPriceLabel.font = FontHelper.eazipDefaultBlackFontWithSize(size: 17)
        
    }
    
    override func layoutSubviews() {
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }
    
    func setData(quantity: Int, price: Int, description: String) {
        quantityPriceLabel.text = "2 x 30€"
        productDescriptionLabel.text = "Rétrécir - Manches"
    }
}

