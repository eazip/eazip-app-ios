//
//  NavigationHelper.swift
//  Eazip
//
//  Created by Marie on 10/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

extension UIViewController {
    func goToScreen(identifier: String) -> Void {
        //var instantClass = NSClassFromString(identifier) as! UIViewController.Type
        //var viewControllerObject = instantClass.init()
        
        let resultViewController = self.storyboard?.instantiateViewController(withIdentifier: identifier)
        self.present(resultViewController!, animated:true, completion:nil)
    }
}
