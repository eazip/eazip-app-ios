//
//  EazipButton.swift
//  Eazip
//
//  Created by Marie on 26/01/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class EazipButton: UIButton {
    
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
        self.titleLabel?.font = FontHelper.eazipDefaultRegularFontWithSize(size: 20)
    }

}
