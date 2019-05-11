//
//  ClothItemViewCell.swift
//  Eazip
//
//  Created by Marie on 11/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class ClothItemViewCell: UITableViewCell {
    
    @IBOutlet weak var clothIcon: UIImageView!
    @IBOutlet weak var clothLabel: EazipLabel!
    @IBOutlet weak var countLabel: DefaultText!
    @IBOutlet weak var minusButton: UIImageView!
    @IBOutlet weak var plusButton: UIImageView!
    
    var count : Int = 0
    
    // Main Cell Colors
    let clothItemBackgroundColor : UIColor = UIColor(named: "backgroundLightGrey")!
    
    /**
     /////////////////////
     Up
     /////////////////////
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpWrapperView()
        updateCountLabel()
    }
    
    override func layoutSubviews() {
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }
    
    func setUpWrapperView() {
        self.backgroundColor = clothItemBackgroundColor
        self.clothLabel?.font = FontHelper.eazipDefaultBlackFontWithSize(size: 17)
    }
    
    func setData(icon: UIImage, label: String) {
        clothIcon.image = icon
        clothLabel.text = label
    }
    
    func updateCountLabel() {
        countLabel.text = String(describing: count)
    }
}
