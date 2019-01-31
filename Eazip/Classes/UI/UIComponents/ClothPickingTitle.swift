//
//  ClothPickingTitle.swift
//  Eazip
//
//  Created by Quentin Michalet on 29/01/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class ClothPicking: UILabel {
    
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
        self.font = FontHelper.eazipDefaultBlackFontWithSize(size: 25)
        self.textAlignment = .center
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        self.sizeToFit()
    }
    
}
