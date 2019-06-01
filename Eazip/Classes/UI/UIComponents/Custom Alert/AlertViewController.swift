//
//  AlertViewController.swift
//  Eazip
//
//  Created by Marie on 30/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    @IBOutlet weak var alertIcon: UIImageView!
    @IBOutlet weak var alertTitleLabel: EazipLabel!
    @IBOutlet weak var alertMainTextLabel: DefaultText!
    @IBOutlet weak var alertActionButton: ColoredActionButton!
    @IBOutlet weak var alertCloseButton: WhiteActionButton!
    
    var icon = UIImage()
    var labelTitle = String()
    var body = String()
    var actionButtonText = String()
    var action : (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        alertIcon.image = icon
        alertTitleLabel.text = labelTitle
        alertMainTextLabel.text = body
        alertActionButton.setTitle(actionButtonText, for: .normal)
    }
    
    func setUpUI() {
        alertTitleLabel.textAlignment = .center
        alertMainTextLabel.textAlignment = .center
        alertCloseButton.setTitleColor(UIColor.white, for: .normal)
        alertCloseButton.setTitle("Fermer", for: .normal)
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated:true)
    }
    
    @IBAction func action(_ sender: Any) {
        dismiss(animated:true)
        action!()
    }
}
