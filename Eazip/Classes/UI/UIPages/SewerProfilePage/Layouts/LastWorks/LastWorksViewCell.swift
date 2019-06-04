//
//  lastWorksViewCell.swift
//  Eazip
//
//  Created by Marie on 29/03/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class LastWorksViewCell: UICollectionViewCell, ConfigurableCell {

    @IBOutlet weak var lastWorksLabel: UILabel!
    var lastWorks : [UIImage] = []
    
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
    
    func configure(data works: [UIImage]) {
        lastWorksLabel.text = "Dernière retouche"
    }
}
    
