//
//  DefaultLightText.swift
//  Eazip
//
//  Created by Marie on 17/03/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class DefaultLightText: UILabel {
    
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
        self.font = FontHelper.avenirBookFontWithSize(size: 17)
        self.textColor = UIColor(named:"lightGrey")
        self.textAlignment = .left
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        self.sizeToFit()
    }
    
}
