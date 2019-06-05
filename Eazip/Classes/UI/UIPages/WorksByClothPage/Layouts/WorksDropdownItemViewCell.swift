//
//  worksDropdownItemViewCell.swift
//  Eazip
//
//  Created by Marie on 13/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

protocol ExpandableDropdownDelegate {
    func openerButtonTouched(indexPath: IndexPath, size: CGFloat)
}

class WorksDropdownItemViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var dropDownIcon: UIImageView!
    @IBOutlet weak var dropDownWrapper: UIView!
    @IBOutlet weak var OpenerButton: UIButton!
    @IBOutlet weak var worksListTableView: UITableView!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    
    var cellHeight : CGFloat!
    
    var indexPath : IndexPath!
    var delegate : ExpandableDropdownDelegate?
    var tableState : Bool!
    
    /**
     /////////////////////
     Up
     /////////////////////
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpOpenerButton()
        initWorksListTableView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        worksListTableView.layoutIfNeeded()
        
        //Items height
        tableHeight?.constant = worksListTableView.contentSize.height
        cellHeight = 70
        
        if tableState {
            dropDownIcon.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        } else {
            dropDownIcon.transform = CGAffineTransform.identity
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
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
        worksListTableView?.separatorStyle = .none
    }
    
    func initWorkChoiceItemCell(cellIdentifier: String) {
        worksListTableView?.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func setData(category: String) {
        OpenerButton?.setTitle(category, for: .normal)
    }
    
    @IBAction func openTable(_ sender: Any) {
        toggleTableVisibility()
        delegate?.openerButtonTouched(indexPath: indexPath, size: cellHeight)
        layoutIfNeeded()
        superview?.layoutIfNeeded()
    }
    
    func toggleTableVisibility() {
        if !tableState {
            tableState = true
            showTable()
        } else {
            tableState = false
            hideTable()
        }
    }
    
    func showTable() {
        cellHeight = tableHeight.constant + 90
        UIView.animate(withDuration: 0.3, animations: {
            self.dropDownIcon.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        })
    }
    
    func hideTable() {
        cellHeight = 70
        UIView.animate(withDuration: 0.3, animations: {
            self.dropDownIcon.transform = CGAffineTransform.identity
        })
    }
    
    func isDropdownExpanded() -> Bool {
        return tableState
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
        cell.setData(label: "Ourlet simple", price: "15€", serviceId: 1, clothId: 1)

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
            cell.selectionStyle = .none
            cell.tapAnimation()
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let isCell = tableView.cellForRow(at: indexPath) {
            let cell = isCell as! WorkChoiceItemViewCell
            cell.toggleSelected()
        }
    }
}
