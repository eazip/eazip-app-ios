//
//  LoginPageController.swift
//  Eazip
//
//  Created by Marie on 26/01/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class WelcomePageController: UIViewController {
    
    @IBOutlet weak var mainTitle = EazipLabel()
    @IBOutlet weak var signInButton = WhiteActionButton()
    @IBOutlet weak var signUpButton = ColoredActionButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMainTitle()
        setUpSignUpButton()
        setUpSignInButton()
    }
    
    func setUpMainTitle()  {
        mainTitle?.text = "Aequaliterque ipse pariter termini qui benevolentiae."
    }
    
    func setUpSignUpButton()  {
        signUpButton?.setTitle("Register", for: .normal)
    }
    
    func setUpSignInButton()  {
        signInButton?.setTitle("Login", for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

