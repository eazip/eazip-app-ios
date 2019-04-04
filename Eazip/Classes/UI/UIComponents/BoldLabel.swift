//
//  RegularLabel.swift
//  Eazip
//
//  Created by Marie on 24/03/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class BoldLabel: UILabel {
    
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
        self.font = FontHelper.avenirBlackFontWithSize(size: 20)
        self.textColor = UIColor.black
        self.textAlignment = .left
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        self.sizeToFit()
    }
    
}

