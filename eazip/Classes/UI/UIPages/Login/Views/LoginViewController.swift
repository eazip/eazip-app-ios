//
//  LoginViewController.swift
//  eazip
//
//  Created by Marie on 24/01/2019.
//  Copyright © 2019 eazip. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let signInButton = MainActionButton()
    let signUpButton = MainActionButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSignInButton()
        view.backgroundColor = UIColor.red
    }
    
    func setUpSignInButton() {
        signInButton.setTitle("SIGN IN", for: .normal)
        view.addSubview(signInButton)
        setSignInButtonContraints()
    }
    
    func setSignInButtonContraints() {
        let height : CGFloat = 50
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: height).isActive = true
        signInButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
