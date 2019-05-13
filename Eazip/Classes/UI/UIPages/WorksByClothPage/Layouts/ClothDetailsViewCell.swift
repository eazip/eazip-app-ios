//
//  ClothDetailsViewCell.swift
//  Eazip
//
//  Created by Marie on 12/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class ClothDetailsViewCell: UICollectionViewCell {

    @IBOutlet weak var clothTitleWrapper: UIView!
    @IBOutlet weak var clothIcon: UIImageView!
    @IBOutlet weak var clothLabel: UILabel!
    // Main Colors
    let wrapperBackgroundColor : UIColor = UIColor(named: "backgroundLightGrey")!
    
    /**
     /////////////////////
     Up
     /////////////////////
     */
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
//    func initPaymentMethodsTableView() {
//        //Init wrapper
//        setUptableViewWrapper()
//
//        //Init cell
//        initPaymentItemCell(cellIdentifier: "PaymentItemViewCell")
//
//        //Init delegate and datasource
//        paymentMethodsTableView?.estimatedRowHeight = 60
//        paymentMethodsTableView?.rowHeight = UITableViewAutomaticDimension
//        //paymentMethodsTableView?.isScrollEnabled = false
//        paymentMethodsTableView?.delegate = self
//        paymentMethodsTableView?.dataSource = self
//    }
//
//    func initWorkItemCell(cellIdentifier: String) {
//        paymentMethodsTableView?.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
//    }
    
    func setData(icon: UIImage, label: String) {
        clothIcon.image = icon
        clothLabel.text = label
    }
}
