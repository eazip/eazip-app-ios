//
//  ClothItemViewCell.swift
//  Eazip
//
//  Created by Marie on 11/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class ClothItemViewCell: UITableViewCell {
    
    @IBOutlet weak var clothIcon: UIImageView!
    @IBOutlet weak var clothLabel: EazipLabel!
    @IBOutlet weak var countLabel: DefaultText!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    var count : Int = 0
    var itemID : Int = 1
    var associatedTableView : UITableView? = nil
    
    // Main Cell Colors
    let clothItemBackgroundColor : UIColor = UIColor(named: "backgroundLightGrey")!
    
    /**
     /////////////////////
     Up
     /////////////////////
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpWrapperView()
        updateCountLabel()
    }
    
    override func layoutSubviews() {
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        resetCount()
    }
    
    func setUpWrapperView() {
        self.backgroundColor = clothItemBackgroundColor
        self.clothLabel?.font = FontHelper.eazipDefaultBlackFontWithSize(size: 17)
    }
    
    func setData(tableView: UITableView, icon: UIImage, label: String) {
        clothIcon.image = icon
        clothLabel.text = label
        associatedTableView = tableView
    }
    
    @IBAction func addCloth(_ sender: UIButton) {
        addOne()
        updateCountLabel()
        let indexPath = IndexPath(row: 1, section: 0)
        associatedTableView?.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        associatedTableView?.delegate?.tableView!(associatedTableView!, didSelectRowAt: indexPath)
    }
    
    @IBAction func removeCloth(_ sender: UIButton) {
        removeOne()
        updateCountLabel()
    }
    
    func addOne() {
        if count < 10 {
          count += 1
        }
    }
    
    func removeOne() {
        if count > 0 {
            count -= 1
        }
    }
    
    func resetCount() {
        count = 0
        updateCountLabel()
    }
    
    func updateCountLabel() {
        countLabel.text = String(describing: count)
    }
    
    func getItemID() -> Int {
        return itemID
    }
    
    func getCount() -> Int {
        return count
    }
}
