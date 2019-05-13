//
//  WorkChoiceItemViewCell.swift
//  Eazip
//
//  Created by Marie on 13/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class WorkChoiceItemViewCell: UITableViewCell {

    @IBOutlet weak var workLabel: DefaultText!
    @IBOutlet weak var workPrice: DefaultLightText!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(label: String, price: String) {
        workLabel.text = label
        workPrice.text = price
    }
    
}
