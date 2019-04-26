//
//  PaymentMethodsViewCell.swift
//  Eazip
//
//  Created by Marie on 23/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class PaymentMethodsViewCell: UICollectionViewCell, ConfigurableCell, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableViewWrapper: UIView!
    @IBOutlet weak var paymentMethodsTitleLabel: UILabel!
    @IBOutlet weak var paymentMethodsTableView: UITableView!
    @IBOutlet weak var newPaymentMethodButton: UIButton!
    
    var paymentMethods : [[String: Any]] = []
    
    // Main Colors
    let borderColor : UIColor = UIColor(named: "borderLightGrey")!
    let wrapperBackgroundColor : UIColor = UIColor(named: "backgroundLightGrey")!
    let buttonTextColor : UIColor = UIColor(named: "lightGrey")!
    
    /**
     /////////////////////
     Up
     /////////////////////
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpPaymentMethodsTitleLabel()
        initPaymentMethodsTableView()
        setUpNewPaymentMethodButton()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        paymentMethodsTableView.layoutIfNeeded()
    }
    
    func setUpPaymentMethodsTitleLabel() {
        paymentMethodsTitleLabel.text = "Modes de paiement"
        paymentMethodsTitleLabel.font = FontHelper.eazipDefaultBlackFontWithSize(size: 15)
    }
    
    func setUptableViewWrapper() {
        tableViewWrapper?.backgroundColor = wrapperBackgroundColor
    }
    
    func setUpNewPaymentMethodButton() {
        newPaymentMethodButton?.layer.borderWidth = 1
        newPaymentMethodButton?.layer.cornerRadius = 5
        newPaymentMethodButton?.layer.borderColor = borderColor.cgColor
        newPaymentMethodButton?.backgroundColor = UIColor.white
        newPaymentMethodButton?.setTitle("+ Ajouter un nouveau mode de paiement", for: .normal)
        newPaymentMethodButton?.titleLabel?.font = FontHelper.avenirBlackFontWithSize(size: 13)
        newPaymentMethodButton?.setTitleColor(buttonTextColor, for: .normal)
    }
    
    func initPaymentMethodsTableView() {
        //Init wrapper
        setUptableViewWrapper()
        
        //Init cell
        initPaymentItemCell(cellIdentifier: "PaymentItemViewCell")
        
        //Init delegate and datasource
        paymentMethodsTableView?.estimatedRowHeight = 60
        paymentMethodsTableView?.rowHeight = UITableViewAutomaticDimension
        //paymentMethodsTableView?.isScrollEnabled = false
        paymentMethodsTableView?.delegate = self
        paymentMethodsTableView?.dataSource = self
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
    
    func initPaymentItemCell(cellIdentifier: String) {
        paymentMethodsTableView?.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return paymentMethods.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 15
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var paymentItem : [String: Any] = [:]
        
        for (index, item) in paymentMethods.enumerated() {
            if indexPath.section == index {
                paymentItem = item
            }
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentItemViewCell") as! PaymentItemViewCell
        cell.setData(cbType: paymentItem["cbType"] as! String, cbNb: paymentItem["cbNb"] as! Int)
        
        return cell
    }
    
    private func tableView(_ tableView: UITableView, sizeForRowAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: paymentMethodsTableView.frame.width, height:60)
        
        return size
    }
    
    public func configure(data: Customer) {
        paymentMethods = data.paymentMethods
    }

}
