//
//  CustomNavigationUIHelper.swift
//  Eazip
//
//  Created by Marie on 08/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

extension UITextField {
    func setCustomNavigationUI() -> Void {
        let backGroundColor : UIColor = UIColor(named: "backgroundLightGrey")!
        let textColor : UIColor = UIColor(named: "lightGrey")!
        self.backgroundColor = backGroundColor
        self.font = FontHelper.eazipDefaultBlackFontWithSize(size: 20)
        self.textColor = textColor
        self.textAlignment = .center
        self.sizeToFit()
    }
}

