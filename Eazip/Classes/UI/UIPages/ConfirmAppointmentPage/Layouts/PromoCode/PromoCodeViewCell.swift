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
    @IBOutlet weak var stateIcon: UIImageView!
    
    let promoCodeTextFieldPlaceHolder = "Exemple : AIZOIEPL78"
    var promoCodeValue : String = ""
    
    // Main Colors
    let borderColor : UIColor = UIColor(named: "borderLightGrey")!
    let buttonTextColor : UIColor = UIColor(named: "lightGrey")!
    
    // Messages to display
    let errorMessage : String = "Le code promo est invalide"
    let successMessage : String = "-10% de remise pour la fête des mères"
    let expectedCodeValue : String = "LOVEMUM83"
    
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
        if promoCodeValue == "" {
            promoCodeTextField.text = ""
            promoCodeTextField.textColor = UIColor.black
        }
    }
    
    @objc func updateTextField() {
        if promoCodeTextField.text == "" {
            resetTextField()
        } else {
            superview?.endEditing(true)
            promoCodeValue = promoCodeTextField.text!
            displayMessage()
            
            if promoCodeValue != expectedCodeValue {
                setErrorBehaviour()
            } else {
                setSuccessBehaviour()
            }
        }
    }
    
    func resetTextField() {
        setUpTextFieldPlaceHolder()
        promoCodeValue = ""
        stateIcon.image = UIImage(named:"add_new")
        hideMessage()
    }
    
    func setUpTextFieldPlaceHolder() {
        promoCodeTextField.text = promoCodeTextFieldPlaceHolder
        promoCodeTextField.font = FontHelper.avenirBlackFontWithSize(size: 13)
        promoCodeTextField.textColor = buttonTextColor
    }
    
    func displayMessage() {
        messageLabel.isHidden = false
    }
    
    func hideMessage() {
        messageLabel.isHidden = true
    }
    
    func setErrorBehaviour() {
        messageLabel.text = errorMessage
        messageLabel.textColor = UIColor.red
    }
    
    func setSuccessBehaviour() {
        messageLabel.text = successMessage
        messageLabel.textColor = UIColor.green
        stateIcon.image = UIImage(named:"success_icon")
    }
    
    func configure(data: [Product]) {
        
    }
}
