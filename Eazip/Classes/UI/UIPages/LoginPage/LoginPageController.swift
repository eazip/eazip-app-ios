//
//  LoginPageController.swift
//  Eazip
//
//  Created by Marie on 26/01/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class loginPageController: UIViewController {
    
    @IBOutlet weak var signInButton = MainActionButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSignInButton()
    }

    
    func setUpSignInButton()  {
        signInButton?.setTitle("SIGN IN", for: .normal)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
