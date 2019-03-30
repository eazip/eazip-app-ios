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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        let scrollViewWidth:CGFloat = lastWorksScrollView.frame.width
        let scrollViewHeight:CGFloat = lastWorksScrollView.frame.height
        lastWorksScrollView.backgroundColor = UIColor.blue
        
        let imgOne = UIImageView(frame: CGRect(x:0, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgOne.image = UIImage(named:"sewerPicture2")
        let imgTwo = UIImageView(frame: CGRect(x:scrollViewWidth, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgTwo.image = UIImage(named:"AppIcon")
        let imgThree = UIImageView(frame: CGRect(x:scrollViewWidth*2, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgThree.image = UIImage(named:"sewerPicture2")
        
        lastWorksScrollView.addSubview(imgOne)
        lastWorksScrollView.addSubview(imgTwo)
        lastWorksScrollView.addSubview(imgThree)
        
        lastWorksScrollView.contentSize = CGSize(width:scrollViewWidth * 3, height:scrollViewHeight)
        lastWorksScrollView.delegate = self
        lastWorksPageControl.currentPage = 0

    }
    
    
    func setData(works: [UIImage]) {
        lastWorksLabel.text = "Dernières retouches"
        
    }
    

}
    