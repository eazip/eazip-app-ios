//
//  CustomizeButtonHelper.swift
//  Eazip
//
//  Created by Marie on 29/01/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

extension UIButton {
    func setEazipButtonProperties() -> Void {
        let layer : CALayer = CALayer()
        self.titleLabel?.font = FontHelper.eazipDefaultBlackFontWithSize(size: 18)
        self.clipsToBounds = true
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 7.0
        self.layer.cornerRadius = 25
        self.layer.shadowOffset = CGSize.zero
        self.setTitleColor(.white, for: .normal)
        self.layer.insertSublayer(layer, at: 0)
    }
}
