//
//  worksDropdownItemViewCell.swift
//  Eazip
//
//  Created by Marie on 13/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class WorksDropdownItemViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var dropDownWrapper: UIView!
    @IBOutlet weak var OpenerButton: UIButton!
    @IBOutlet weak var worksListTableView: UITableView!
    
    /**
     /////////////////////
     Up
     /////////////////////
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        initWorksListTableView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        worksListTableView.layoutIfNeeded()
        dropDownWrapper.layoutIfNeeded()
        self.tableHeight?.constant = worksListTableView.contentSize.height
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
    
    func initWorksListTableView() {
        //Init cell
        initWorkChoiceItemCell(cellIdentifier: "WorkChoiceItemViewCell")
        
        //Init delegate and datasource
        worksListTableView?.rowHeight = 60
        worksListTableView?.isScrollEnabled = false
        worksListTableView?.delegate = self
        worksListTableView?.dataSource = self
    }
    
    func initWorkChoiceItemCell(cellIdentifier: String) {
        worksListTableView?.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func setData() {
        OpenerButton?.setTitle("Category", for: .normal)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkChoiceItemViewCell") as! WorkChoiceItemViewCell
        cell.setData(label: "Test", price: "15€")
        
        return cell
    }
    
    private func tableView(_ tableView: UITableView, sizeForRowAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: worksListTableView.frame.width, height:60)
        
        return size
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.layoutIfNeeded()
    }
}
