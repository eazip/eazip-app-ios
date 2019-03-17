//
//  SewerProfileController.swift
//  Eazip
//
//  Created by Marie on 14/03/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class SewerProfileController: UIViewController {
    
    @IBOutlet var descriptionTitle : UILabel?
    @IBOutlet var descriptionContent : UILabel?
    @IBOutlet weak var sewerPictureView : UIImageView!
    @IBOutlet var showAvailabilityBtn : ColoredActionButton?
    @IBOutlet var lastWorksTitle : UILabel?

   

    override func viewDidLoad() {
        let sewerPicture = UIImage(named:"sewerPicture2")!
        sewerPictureView.image = sewerPicture
        let view = UIView()
        
        let gradient = CAGradientLayer()
        
        gradient.frame = view.frame
        
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        
        gradient.locations = [0.0, 1.0]
        
        view.layer.insertSublayer(gradient, at: 0)
        
        super.viewDidLoad()
        setUpDescription()
        
        showAvailabilityBtn?.setTitle("Voir ses disponibilités", for: .normal)
    }
    
    func setUpDescription() {
        descriptionTitle?.text = "Description"
        descriptionContent?.text = "Denique Antiochensis ordinis vertices sub uno elogio iussit occidi ideo efferatus, quod ei celebrari vilitatem intempestivam urgenti, cum inpenderet inopia, gravius rationabili responderunt; et perissent ad unum ni comes orientis tunc Honoratus fixa constantia restitisset."
        descriptionContent?.textColor = UIColor(named:"lightGrey")
        descriptionTitle?.font = FontHelper.eazipDefaultBlackFontWithSize(size: 24)
    }
}
