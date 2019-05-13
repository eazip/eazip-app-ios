//
//  worksDropdownItemViewCell.swift
//  Eazip
//
//  Created by Marie on 13/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class WorksDropdownItemViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var dropDownWrapper: UIView!
    @IBOutlet weak var OpenerButton: UIButton!
    @IBOutlet weak var worksListTableView: UITableView!
    
    var worksListByType : [[String: String]] = []
    
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
    
    func initPaymentMethodsTableView() {
        //Init wrapper
        //setUptableViewWrapper()
        
        //Init cell
        //initPaymentItemCell(cellIdentifier: "PaymentItemViewCell")
        
        //Init delegate and datasource
        worksListTableView?.estimatedRowHeight = 70
        worksListTableView?.rowHeight = UITableViewAutomaticDimension
        worksListTableView?.isScrollEnabled = false
        worksListTableView?.delegate = self
        worksListTableView?.dataSource = self
    }
    
    func setData(worksList: [[String: String]]) {
        worksListByType = worksList
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worksList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let workItem = worksListByType[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkChoiceItemViewCell") as! PaymentItemViewCell
        cell.setData(label: "Test", price: "15€")
        
        return cell
    }
    
    private func tableView(_ tableView: UITableView, sizeForRowAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: paymentMethodsTableView.frame.width, height:60)
        
        return size
    }
}
