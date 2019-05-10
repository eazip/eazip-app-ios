//
//  DefaultNavigation.swift
//  Eazip
//
//  Created by Marie on 01/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class DefaultNavigation: UINavigationBar {
    
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
       
    }
}
