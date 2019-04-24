//
//  PromoCodeViewCell.swift
//  Eazip
//
//  Created by Marie on 24/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class PromoCodeViewCell: UICollectionViewCell, ConfigurableCell {
    @IBOutlet weak var promoCodeTitleLabel: UILabel!
    @IBOutlet weak var promoCodeTextField: UITextField!
    @IBOutlet weak var addNewPromoCodeButton: UIButton!
    
    let promoCodeTextFieldPlaceHolder = "Exemple : AIZOIEPL78"
    
    // Main Colors
    let borderColor : UIColor = UIColor(named: "borderLightGrey")!
    let buttonTextColor : UIColor = UIColor(named: "lightGrey")!
    
    /**
     /////////////////////
     Up
     /////////////////////
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpPromoCodeTitleLabel()
        setUpNewPromoCodeButton()
    }
    
    override func layoutSubviews() {
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
    }
    
    func setUpPromoCodeTitleLabel() {
        promoCodeTitleLabel.text = "Codes promo"
        promoCodeTitleLabel.font = FontHelper.eazipDefaultBlackFontWithSize(size: 15)
    }
    
    func setUpTextField() {
        promoCodeTextField.text = promoCodeTextFieldPlaceHolder
        promoCodeTextField.font = FontHelper.avenirBlackFontWithSize(size: 13)
        promoCodeTextField.textColor = buttonTextColor
    }
    
    func setUpNewPromoCodeButton() {
        addNewPromoCodeButton?.layer.borderWidth = 1
        addNewPromoCodeButton?.layer.cornerRadius = 5
        addNewPromoCodeButton?.layer.borderColor = borderColor.cgColor
        addNewPromoCodeButton?.setTitle("+ Ajouter un nouveau code promo", for: .normal)
        addNewPromoCodeButton?.titleLabel?.font = FontHelper.avenirBlackFontWithSize(size: 13)
        addNewPromoCodeButton?.titleLabel?.textColor = buttonTextColor
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        
        return layoutAttributes
    }
    
    func configure(data: [Product]) {
        
    }
}
