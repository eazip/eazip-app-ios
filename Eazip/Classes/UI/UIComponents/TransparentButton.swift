//
//  TransparentButton.swift
//  Eazip
//
//  Created by Marie on 30/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class TransparentButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    override func prepareForInterfaceBuilder() {
        setUp()
    }
    
    func setUp() {
        self.setEazipButtonProperties()
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = FontHelper.avenirBlackFontWithSize(size: 20)
        self.backgroundColor = UIColor.clear
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
    }
}

