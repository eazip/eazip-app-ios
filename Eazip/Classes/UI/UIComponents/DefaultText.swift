//
//  DefaultText.swift
//  Eazip
//
//  Created by Marie on 07/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class DefaultText: UILabel {
    
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
        self.textColor = UIColor.black
        self.textAlignment = .left
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        self.sizeToFit()
    }
    
}
