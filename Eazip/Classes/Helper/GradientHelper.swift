//
//  GradientHelper.swift
//  Eazip
//
//  Created by Marie on 28/01/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

extension UIView {
    func setEazipGradient(colors:[UIColor])  -> Void {
        self.setEazipGradient(colors: colors, locations: nil)
    }
    
    func setEazipGradient(colors: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient : CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors.map {$0.cgColor}
        gradient.locations = locations
        gradient.startPoint = CGPoint(x: 0.0, y:1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.layer.insertSublayer(gradient, at: 0)
    }
}
