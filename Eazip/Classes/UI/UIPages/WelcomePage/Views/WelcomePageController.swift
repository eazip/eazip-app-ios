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
    @IBOutlet weak var signInButton = MainActionButton()
    @IBOutlet weak var signUpButton = MainActionButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMainTitle()
        setUpSignInButton()
        setUpSignUpButton()
    }
    
    func setUpMainTitle()  {
        mainTitle?.text = "Aequaliterque ipse pariter termini qui benevolentiae."
    }
    
    func setUpSignInButton()  {
        signInButton?.setTitle("SIGN IN", for: .normal)
    }
    
    func setUpSignUpButton()  {
        signUpButton?.setTitle("SIGN UP", for: .normal)
        signUpButton?.backgroundColor = UIColor.white
        signUpButton?.self.setTitleColor(.black, for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

