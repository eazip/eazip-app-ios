//
//  lastWorksViewCell.swift
//  Eazip
//
//  Created by Marie on 29/03/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class LastWorksViewCell: UICollectionViewCell, UIScrollViewDelegate {

    @IBOutlet weak var lastWorksScrollView: UIScrollView!
    @IBOutlet weak var lastWorksLabel: UILabel!
    @IBOutlet weak var lastWorksPageControl: UIPageControl!
    
    var lastWorks : [UIImage] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lastWorksScrollView.delegate = self
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
        let scrollViewWidth:CGFloat = lastWorksScrollView.frame.width
        let scrollViewHeight:CGFloat = lastWorksScrollView.frame.height
        for lastWork in lastWorks {
            let img = UIImageView(frame: CGRect(x:0, y:0,width:scrollViewWidth, height:scrollViewHeight))
            img.image = lastWork
            lastWorksScrollView.addSubview(img)
            img.frame = lastWorksScrollView.bounds
        }
        let lastWorksCount = CGFloat(lastWorks.count)
        lastWorksScrollView.contentSize = CGSize(width:scrollViewWidth * lastWorksCount, height:scrollViewHeight)
        lastWorksScrollView.bringSubview(toFront: lastWorksPageControl)
    }
    
    func setData(works: [UIImage]) {
        lastWorksLabel.text = "Dernières retouches"
        
        for work in works {
            lastWorks.append(work)
        }
        
        
    }
    

}
    
