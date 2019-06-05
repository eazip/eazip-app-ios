//
//  WorkChoiceItemViewCell.swift
//  Eazip
//
//  Created by Marie on 13/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class WorkChoiceItemViewCell: UITableViewCell {
    
    @IBOutlet weak var successIcon: UIImageView!
    @IBOutlet weak var workLabel: DefaultText!
    @IBOutlet weak var workPrice: DefaultLightText!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var serviceID : Int = 0
    var clothID : Int = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
    }

    func setData(label: String, price: String, serviceId: Int, clothId: Int) {
        workLabel.text = label
        workPrice.text = price
        serviceID = serviceId
        clothID = clothId
    }
    
    func toggleSelected() {
        if (isSelected) {
            setSelectedCellBehaviour()
        } else {
            setDeselectedCellBehaviour()
        }
    }
    
    func setSelectedCellBehaviour() {
        successIcon.isHidden = false
    }
    
    func setDeselectedCellBehaviour() {
        successIcon.isHidden = true
    }
    
    func getChoiceId() -> Int {
        return serviceID
    }
    
    func tapAnimation() {
        UIView.animate(withDuration: 0.2, animations: {
            self.backgroundColor = UIColor(named: "lightPeachColor")
            self.backgroundColor = UIColor(named: "backgroundLightGrey")
        })
    }
}
