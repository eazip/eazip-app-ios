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
    @IBOutlet var reviewsTitle : UILabel?
    @IBOutlet var tableView : UITableView?
    var sewerReviewsList: [SewerReview] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSewerPicture()
        setUpDescription()
        setUpLastWorks()
        sewerReviewsList = setUpReviews()
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = UITableViewAutomaticDimension
        tableView?.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0)
    
        showAvailabilityBtn?.setTitle("Voir ses disponibilités", for: .normal)
    }
    
    func setUpSewerPicture() {
        var screenWidth: CGFloat!
        screenWidth = UIScreen.main.bounds.width
        
        sewerName?.text = "Tamère"
        sewerName?.font = FontHelper.eazipDefaultBlackFontWithSize(size: 30)
        sewerName?.textColor = UIColor.white
        rankLabel?.text = "4.0"
        
        let sewerPicture = UIImage(named:"sewerPicture2")!
        sewerPictureView.image = sewerPicture
        
        let view = UIView(frame: sewerPictureView.frame)
        view.translatesAutoresizingMaskIntoConstraints = false
        sewerPictureView.addSubview(view)
        sewerPictureView.bringSubview(toFront: view)
        view.frame.size.width = screenWidth
       
        let gradient = CAGradientLayer()
        gradient.frame = view.frame
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0, 1.0]
        
        view.layer.insertSublayer(gradient, at: 0)

        view.addSubview(sewerName!)
        view.bringSubview(toFront: sewerName!)
        view.addSubview(rankLabel!)
        view.bringSubview(toFront: rankLabel!)
        sewerName?.bottomAnchor.constraint(equalTo: sewerPictureView.bottomAnchor, constant: -45).isActive = true
        rankLabel?.bottomAnchor.constraint(equalTo: sewerPictureView.bottomAnchor, constant: -15).isActive = true
        
        setUpRating()
    }
    
    func setUpRating() {
       
    }
    
    func setUpDescription() {
        descriptionTitle?.text = "Description"
        descriptionContent?.text = "Denique Antiochensis ordinis vertices sub uno elogio iussit occidi ideo efferatus, quod ei celebrari vilitatem intempestivam urgenti, cum inpenderet inopia, gravius rationabili responderunt; et perissent ad unum ni comes orientis tunc Honoratus fixa constantia restitisset."
    }
    
    func setUpLastWorks() {
        lastWorksTitle?.text = "Dernières retouches"
    }
    
    func setUpReviews() -> [SewerReview] {
        reviewsTitle?.text = "Avis (4)"
        var tempReviews: [SewerReview] = []
        
        let reviewOne = SewerReview(author: "Toto", textContent: "Haec igitur prima lex amicitiae sanciatur, ut ab amicis honesta petamus, amicorum causa honesta faciamus. Ut ab amicis honesta petamus, amicorum causa honesta faciamus")
        let reviewTwo = SewerReview(author: "Titi", textContent: "Haec igitur prima lex amicitiae sanciatur, ut ab amicis honesta petamus, amicorum causa honesta faciamus. Ut ab amicis honesta petamus, amicorum causa honesta faciamus")
        
        tempReviews.append(reviewOne)
        tempReviews.append(reviewTwo)
        
        return tempReviews
    }
}

extension SewerProfileController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sewerReviewsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sewerReview = sewerReviewsList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SewerReviewCell") as! SewerReviewCell
        
        cell.setSewerReview(review: sewerReview)
        
        return cell
    }
}
