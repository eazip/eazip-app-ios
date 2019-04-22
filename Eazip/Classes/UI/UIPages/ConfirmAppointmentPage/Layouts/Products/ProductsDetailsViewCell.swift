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
        
    }
    
    func initProductsTableView() {
        //Init wrapper
        setUptableViewWrapper()
        
        //Init cell
        initItemProductCell(cellIdentifier: "ProductItemViewCell")
        
        //Init delegate and datasource
        productsTableView?.delegate = self as UITableViewDelegate
        productsTableView?.dataSource = self as UITableViewDataSource
    }
    
    func setUptableViewWrapper() {
        tableViewWrapper?.layer.borderWidth = 1
        tableViewWrapper?.layer.cornerRadius = 7
        tableViewWrapper?.layer.borderColor = borderColor.cgColor
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
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let sectionLabel = EazipLabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
        
        for (index, product) in clothsToSew.enumerated() {
            if section == index {
                sectionLabel.text = product.cloth
            }
        }
        
        headerView.backgroundColor = UIColor.white
        sectionLabel.font = FontHelper.eazipDefaultBlackFontWithSize(size: 17)
        sectionLabel.sizeToFit()
        headerView.addSubview(sectionLabel)
        
        return headerView
    }
    
    public func configure(data: [Product]) {
        clothsToSew = data
    }
}