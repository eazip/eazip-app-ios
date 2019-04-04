//
//  ColoredActionButton.swift
//  Eazip
//
//  Created by Marie on 29/01/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

//
//  MainActionButton.swift
//  Eazip
//
//  Created by Marie on 26/01/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class ColoredActionButton: UIButton {
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
        self.setEazipGradient(colors: [UIColor(named: "eazipPeachColor")!, UIColor(named: "eazipLightPeachColor")!])
        self.setTitleColor(.white, for: .normal)
    }
}
