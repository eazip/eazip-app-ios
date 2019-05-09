//
//  LoginPageController.swift
//  Eazip
//
//  Created by Marie on 26/01/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class WelcomePageController: UIViewController {
    
    @IBOutlet weak var mainTitle : UILabel!
    @IBOutlet weak var signInButton : UIButton!
    @IBOutlet weak var signUpButton : UIButton!
    @IBOutlet weak var sewerButton: UIButton!
    @IBOutlet weak var welcomeImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMainTitle()
        setUpWelcomeImage()
        setUpSignUpButton()
        setUpSignInButton()
        setUpSewerButton()
    }
    
    func setUpMainTitle()  {
        mainTitle?.text = "Aequaliterque ipse pariter termini qui benevolentiae."
        mainTitle.textAlignment = .center
    }
    
    func setUpWelcomeImage()  {
        welcomeImage?.image = UIImage(named: "welcome_page_img")
    }
    
    func setUpSignUpButton()  {
        signUpButton?.setTitle("Inscription", for: .normal)
    }
    
    func setUpSignInButton()  {
        signInButton?.setTitle("Connexion", for: .normal)
    }
    
    func setUpSewerButton()  {
        sewerButton?.setTitle("Je suis un(e) couturier(e)", for: .normal)
        sewerButton?.setTitleColor( UIColor(named: "lightGrey"), for: .normal)
    }
}

