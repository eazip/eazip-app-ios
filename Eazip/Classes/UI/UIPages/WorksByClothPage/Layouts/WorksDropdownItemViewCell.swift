//
//  worksDropdownItemViewCell.swift
//  Eazip
//
//  Created by Marie on 13/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class WorksDropdownItemViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var dropDownIcon: UIImageView!
    @IBOutlet weak var wrapperHeight: NSLayoutConstraint!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var dropDownWrapper: UIView!
    @IBOutlet weak var OpenerButton: UIButton!
    @IBOutlet weak var worksListTableView: UITableView!
    
    var tableState : Bool = false
    
    /**
     /////////////////////
     Up
     /////////////////////
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpOpenerButton()
        initWorksListTableView()
        hideTable()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        worksListTableView.layoutIfNeeded()
        dropDownWrapper.layoutIfNeeded()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        hideTable()
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
    
    func setUpOpenerButton() {
        OpenerButton.titleLabel?.font = FontHelper.eazipDefaultBlackFontWithSize(size: 17)
        OpenerButton.contentHorizontalAlignment = .left
        OpenerButton.setTitleColor(.black, for: .normal)
        OpenerButton?.setTitle("Chercher un couturier", for: .normal)
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
    
    @IBAction func openTable(_ sender: Any) {
        toggleTableVisibility()
        layoutIfNeeded()
        superview?.layoutIfNeeded()
        
    }
    
    func toggleTableVisibility() {
        if !tableState {
            showTable()
        } else {
            hideTable()
        }
    }
    
    func hideTable() {
        tableState = false
        UIView.animate(withDuration: 0.3, animations: {
            self.tableHeight?.constant = 0
//            self.wrapperHeight?.constant = (self.tableHeight?.constant)! + 80
            self.worksListTableView.isHidden = true
            self.dropDownIcon.transform = CGAffineTransform.identity
            self.layoutIfNeeded()
            self.superview?.layoutIfNeeded()
        })
    }
    
    func showTable() {
        tableState = true
        UIView.animate(withDuration: 0.3, animations: {
            self.tableHeight?.constant = self.worksListTableView.contentSize.height
            self.wrapperHeight?.constant = (self.tableHeight?.constant)! + 80
            self.dropDownIcon.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.worksListTableView.isHidden = false
            self.layoutIfNeeded()
            self.superview?.layoutIfNeeded()
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkChoiceItemViewCell") as! WorkChoiceItemViewCell
        cell.accessoryType = .none
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let isCell = tableView.cellForRow(at: indexPath) {
            let cell = isCell as! WorkChoiceItemViewCell
            cell.toggleSelected()
            print(cell.getChoiceId())
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let isCell = tableView.cellForRow(at: indexPath) {
            let cell = isCell as! WorkChoiceItemViewCell
            cell.toggleSelected()
        }
    }
}
