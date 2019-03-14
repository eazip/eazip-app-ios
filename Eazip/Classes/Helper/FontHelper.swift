//
//  FontHelper.swift
//  Eazip
//
//  Created by Marie on 26/01/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

struct FontHelper {
    static func eazipDefaultRegularFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "FrankRuhlLibre-Regular", size: size)!
    }
    
    static func eazipDefaultBlackFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "FrankRuhlLibre-Black", size: size)!
    }
    
    static func avenirBookFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "avenir-book", size: size)!
    }
}
