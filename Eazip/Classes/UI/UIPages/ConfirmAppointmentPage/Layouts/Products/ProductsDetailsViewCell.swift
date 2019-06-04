//
//  ProductsDetailsViewCell.swift
//  Eazip
//
//  Created by Marie on 19/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class ProductsDetailsViewCell: UICollectionViewCell, ConfigurableCell, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableViewWrapper: UIView!
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var wrapperHeight: NSLayoutConstraint!
    
    var clothsToSew : [Product] = []
    
    // Main Colors
    let borderColor : UIColor = UIColor(named: "borderLightGrey")!
    
    /**
     /////////////////////
     Up
     /////////////////////
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        initProductsTableView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        productsTableView.layoutIfNeeded()
        wrapperHeight.constant = productsTableView.contentSize.height * 1.5
    }
    
    func initProductsTableView() {
        //Init wrapper
        setUptableViewWrapper()
        
        //Init cell
        initItemProductCell(cellIdentifier: "ProductItemViewCell")
        
        //Init delegate and datasource
        productsTableView?.rowHeight = 25
        productsTableView?.isScrollEnabled = false
        productsTableView?.separatorStyle = .none
        productsTableView?.delegate = self
        productsTableView?.dataSource = self
    }
    
    func setUptableViewWrapper() {
        tableViewWrapper?.layer.masksToBounds = false
        tableViewWrapper?.layer.borderWidth = 1
        tableViewWrapper?.layer.cornerRadius = 5
        tableViewWrapper?.layer.borderColor = borderColor.cgColor
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
    
    func initItemProductCell(cellIdentifier: String) {
        productsTableView?.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return clothsToSew.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var number : Int = 0
        for (index, product) in clothsToSew.enumerated() {
            if section == index {
                number = product.toDo.count
            }
        }
    
        return number
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var productItem : TodoProduct = TodoProduct()
        
        for (index, product) in clothsToSew.enumerated() {
            
            if indexPath.section == index {
                productItem = product.toDo[indexPath.row]
            }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductItemViewCell") as! ProductItemViewCell
        cell.setData(quantity: productItem.quantity, price: productItem.price, description: productItem.description)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let sectionLabel = EazipLabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 20))
        
        for (index, product) in clothsToSew.enumerated() {
            if section == index {
                sectionLabel.text = product.cloth
            }
        }
        
        headerView.backgroundColor = UIColor.white
        sectionLabel.font = FontHelper.avenirBlackFontWithSize(size: 17)
        sectionLabel.sizeToFit()
        headerView.addSubview(sectionLabel)
        
        return headerView
    }
    
    private func tableView(_ tableView: UITableView, sizeForRowAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: productsTableView.frame.width, height:10)
        
        return size
    }
    
    public func configure(data: [Product]) {
        clothsToSew = data
    }
}
