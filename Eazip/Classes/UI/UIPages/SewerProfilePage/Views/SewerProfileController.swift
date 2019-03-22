//
//  SewerProfileController.swift
//  Eazip
//
//  Created by Marie on 14/03/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class SewerProfileController: UIViewController {
    
    @IBOutlet var sewerName : UILabel?
    @IBOutlet var rankLabel : UILabel?
    @IBOutlet var descriptionTitle : UILabel?
    @IBOutlet var descriptionContent : UILabel?
    @IBOutlet weak var sewerPictureView : UIImageView!
    @IBOutlet var showAvailabilityBtn : ColoredActionButton?
    @IBOutlet var lastWorksTitle : UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSewerPicture()
        setUpDescription()
        setUpLastWorks()
        
        showAvailabilityBtn?.setTitle("Voir ses disponibilités", for: .normal)
    }
    
    func setUpSewerPicture() {
        var screenWidth: CGFloat!
        screenWidth = UIScreen.main.bounds.width
        
        sewerName?.text = "Tamère"
        sewerName?.font = FontHelper.eazipDefaultBlackFontWithSize(size: 30)
        sewerName?.textColor = UIColor.white
        
        let sewerPicture = UIImage(named:"sewerPicture2")!
        sewerPictureView.image = sewerPicture
        
        let view = UIView(frame: sewerPictureView.frame)
        view.translatesAutoresizingMaskIntoConstraints = false
        sewerPictureView.addSubview(view)
        sewerPictureView.bringSubview(toFront: view)
        
        view.frame.size.width = screenWidth
       
        view.leftAnchor.constraint(equalTo:sewerPictureView.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo:sewerPictureView.rightAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo:sewerPictureView.trailingAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo:sewerPictureView.leadingAnchor).isActive = true
        view.widthAnchor.constraint(equalTo:sewerPictureView.widthAnchor).isActive = true
        
        let gradient = CAGradientLayer()
        gradient.frame = view.frame
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0, 1.0]
        
        view.layer.insertSublayer(gradient, at: 0)

        view.addSubview(sewerName!)
        view.bringSubview(toFront: sewerName!)
        sewerName?.bottomAnchor.constraint(equalTo: sewerPictureView.bottomAnchor, constant:-45).isActive = true
    }
    
    func setUpDescription() {
        descriptionTitle?.text = "Description"
        descriptionContent?.text = "Denique Antiochensis ordinis vertices sub uno elogio iussit occidi ideo efferatus, quod ei celebrari vilitatem intempestivam urgenti, cum inpenderet inopia, gravius rationabili responderunt; et perissent ad unum ni comes orientis tunc Honoratus fixa constantia restitisset."
    }
    
    func setUpLastWorks() {
        lastWorksTitle?.text = "Dernières retouches"
    }
    
}
