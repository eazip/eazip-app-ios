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
        self.layer.cornerRadius = 27
        self.setTitleColor(.white, for: .normal)
        self.layer.insertSublayer(layer, at: 0)
    }
}
