//
//  SewerViewCell.swift
//  Eazip
//
//  Created by Marie on 30/01/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class SewerViewCell: UICollectionViewCell {
    
    static let identifier = "SewerViewCell"
    
    @IBOutlet weak var sewerNameLabel: UILabel!
    @IBOutlet weak var sewerRatingLabel: UILabel!
    @IBOutlet weak var sewerWorksNbLabel: UILabel!
    @IBOutlet weak var sewerPicture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpSewerPicture()
        setUpSewerName()
        setupSewerWorksNb()
        setupSewerRank()
    }
    
    func setUpSewerPicture() {
        sewerPicture.layer.cornerRadius = 5
        sewerPicture.layer.masksToBounds = true
    }
    
    func setUpSewerName() {
        sewerNameLabel.font = FontHelper.eazipDefaultBlackFontWithSize(size: 20)
    }
    
    func setupSewerWorksNb() {
        sewerWorksNbLabel.font = FontHelper.avenirBookFontWithSize(size: 14)
    }
    
    func setupSewerRank() {
        sewerRatingLabel.font = FontHelper.eazipDefaultBlackFontWithSize(size: 14)
    }
    
    func setData(name: String, rating: Int, worksNb: Int, picture: UIImage) {
        sewerNameLabel.text = name
        sewerRatingLabel.text = String(describing: rating) + "/5"
        sewerWorksNbLabel.text = String(describing: worksNb) + " prestations"
        sewerPicture.image = picture
    }
}

