//
//  WhiteActionButton.swift
//  Eazip
//
//  Created by Marie on 29/01/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class WhiteActionButton: UIButton {
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
        self.backgroundColor = UIColor.white
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font = FontHelper.avenirBlackFontWithSize(size: 20)
    }
}

