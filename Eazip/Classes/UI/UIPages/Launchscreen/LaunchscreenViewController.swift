//
//  LaunchscreenViewController.swift
//  Eazip
//
//  Created by Marie on 03/06/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class LaunchscreenViewController: UIViewController {
    @IBOutlet weak var logo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        logo.font = FontHelper.eazipDefaultBlackFontWithSize(size: 25)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logo.font = FontHelper.eazipDefaultBlackFontWithSize(size: 25)
        self.view.setEazipGradient(colors: [UIColor(named: "peachColor")!, UIColor(named: "lightPeachColor")!])
        UIView.animate(withDuration: 4, delay: 0.1, options: [], animations: {
            self.logo.text = "Ferrandine"
            self.logo.isHidden = false
        }) { (success) in
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            let viewController = storyboard.instantiateInitialViewController()
            UIApplication.shared.keyWindow?.rootViewController = viewController
        }
    }
}
