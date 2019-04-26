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
    @IBOutlet weak var messageLabel: DefaultText!
    @IBOutlet weak var addNewPromoCodeButton: UIButton!
    
    let promoCodeTextFieldPlaceHolder = "Exemple : AIZOIEPL78"
    var promoCodeValue : String = ""
    
    // Main Colors
    let borderColor : UIColor = UIColor(named: "borderLightGrey")!
    let buttonTextColor : UIColor = UIColor(named: "lightGrey")!
    
    // Messages to display
    let errorMessage : String = "Le code promo est invalide"
    let successMessage : String = "-10% pour la fête des mères"
    
    /**
     /////////////////////
     Up
     /////////////////////
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpPromoCodeTitleLabel()
        updateTextField()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        promoCodeTextField.addTarget(self, action: #selector(textFieldTouched), for: .touchDown)
        promoCodeTextField.addTarget(self, action: #selector(updateTextField), for: .editingDidEndOnExit)
    }

    func setUpPromoCodeTitleLabel() {
        promoCodeTitleLabel.text = "Codes promo"
        promoCodeTitleLabel.font = FontHelper.eazipDefaultBlackFontWithSize(size: 15)
    }
    
    @objc func updateTextField() {
        if promoCodeTextField.text == "" {
            setUpTextFieldPlaceHolder()
        }
        promoCodeValue = promoCodeTextField.text!
        print(promoCodeValue)
    }
    
    func setUpTextFieldPlaceHolder() {
        promoCodeTextField.text = promoCodeTextFieldPlaceHolder
        promoCodeTextField.font = FontHelper.avenirBlackFontWithSize(size: 13)
        promoCodeTextField.textColor = buttonTextColor
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
    
    @objc func textFieldTouched(textField: UITextField) {
        promoCodeTextField.text = ""
        promoCodeTextField.textColor = UIColor.black
    }
    
    func setErrorBehaviour() {
        setErrorMessage()
    }
    
    func setSuccessBehaviour() {
        
    }
    
    func setErrorMessage() {
        messageLabel.text = errorMessage
        messageLabel.textColor = UIColor.red
    }
    
    func setSuccessMessage() {
        messageLabel.text = successMessage
        messageLabel.textColor = UIColor.green
    }
    
    func configure(data: [Product]) {
        
    }
}
