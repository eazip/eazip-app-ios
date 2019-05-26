//
//  DescriptionViewCell.swift
//  Eazip
//
//  Created by Marie on 27/03/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

protocol SewerDescriptionViewDelegate {
    func checkSewerAvailabilities()
}

class DescriptionViewCell: UICollectionViewCell, ConfigurableCell {
    var delegate : SewerDescriptionViewDelegate?
    
    @IBOutlet var descriptionTitle : UILabel?
    @IBOutlet var descriptionContent : UILabel?
    @IBOutlet var showAvailabilityBtn : ColoredActionButton?
    
    
    @IBAction func sewerAvailabilities(_ sender: Any) {
        delegate?.checkSewerAvailabilities()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        
        return layoutAttributes
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func configure(data biography: String) {
        descriptionTitle?.text = "Description"
        descriptionContent?.text = biography
        descriptionContent?.sizeToFit()
        showAvailabilityBtn?.setTitle("Voir ses disponibilités", for: .normal)
    }
    
    func setData(biography: String) {
        descriptionTitle?.text = "Description"
        descriptionContent?.text = biography
        descriptionContent?.sizeToFit()
        showAvailabilityBtn?.setTitle("Voir ses disponibilités", for: .normal)
    }
}
