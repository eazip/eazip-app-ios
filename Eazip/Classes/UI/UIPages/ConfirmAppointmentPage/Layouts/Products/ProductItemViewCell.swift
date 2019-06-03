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
        quantityPriceLabel.font = FontHelper.avenirHeavyFontWithSize(size: 17)
    }
    
    override func layoutSubviews() {
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }
    
    func setData(quantity: Int, price: Int, description: String) {
        let quantityToString = String(describing: quantity)
        let priceToString = String(describing: price)
        quantityPriceLabel.text = quantityToString + " x " + priceToString + "€"
        productDescriptionLabel.text = description
    }
}

