//
//  SewerReviewCell.swift
//  Eazip
//
//  Created by Marie on 24/03/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class SewerReviewCell: UITableViewCell {
    
    @IBOutlet weak var reviewTextContent: UILabel!
    @IBOutlet weak var reviewAuthor: UILabel!
    
    func setSewerReview(review: SewerReview) {
        let borderColor : UIColor = UIColor(named: "lightGrey")!
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = borderColor.cgColor
      
        reviewTextContent.text = SewerReview.textContent
        reviewAuthor.text = SewerReview.author
    }
}

