//
//  AppointmentTileViewCell.swift
//  Eazip
//
//  Created by Marie on 01/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class AppointmentTileViewCell: UICollectionViewCell {

    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var dateHourIndicationLabel: UILabel!
    @IBOutlet weak var tagWrapper: UIView!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var worksLabel: UILabel!
    @IBOutlet weak var sewerPicture: UIImageView!
    @IBOutlet weak var sewerName: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var toDoWrapper: UIView!
    @IBOutlet weak var toDoLabel: UILabel!
    
    // Main Cell Colors
    let borderColor : UIColor = UIColor(named: "borderLightGrey")!
    let nextAppointmentBannerColor : UIColor = UIColor(named: "lightPeachColor")!
    let lastAppointmentBannerColor : UIColor = UIColor(named: "backgroundLightGrey")!
    let lightLabelColor : UIColor = UIColor(named: "lightGrey")!
    let tagColor : UIColor = UIColor(named: "darkPeachColor")!
    
    /**
     /////////////////////
     Up
     /////////////////////
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Cell border behaviour
        setUpTileShape(view: self)
        setUpTileShape(view: toDoWrapper)
        
        setUpBanner()
        setUpPicture()
        setUpWorksToDoDetails()
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
    
    func setUpTileShape(view: UIView) {
        view.layer.masksToBounds = false
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 7
        view.layer.borderWidth = 1
        view.layer.borderColor = borderColor.cgColor
    }
    
    func setUpBanner() {
        setUpTag()
        dateHourIndicationLabel.font = FontHelper.avenirBlackFontWithSize(size: 12)
    }
    
    func setUpWorksToDoDetails() {
        toDoLabel.font = FontHelper.avenirBlackFontWithSize(size: 12)
    }
    
    func setUpTag() {
        //Wrapper
        tagWrapper.backgroundColor = tagColor
        tagWrapper?.layer.cornerRadius = 5
        
        //Label
        tagLabel.textColor = UIColor.white
        tagLabel.text = "En attente"
        tagLabel.textAlignment = .center
        tagLabel.font = FontHelper.avenirBlackFontWithSize(size: 12)
    }
    
    func setUpPicture() {
        sewerPicture?.layer.cornerRadius = 7
    }
    
    func setData(appointment: Appointment) {
        let appointmentHour = String(describing: appointment.hour) + "h00"
        let rating = String(describing: appointment.sewer.sewerRating) + "/5"
        let sewerWorks = String(describing: appointment.sewer.sewerWorks.count) + " prestations"
        let toDo = String(describing: appointment.products.count)
        let toDolabel = (appointment.products.count == 1) ? toDo + " retouche" : toDo + " retouches"
        
        dateHourIndicationLabel.text = appointment.date + ", dès " + appointmentHour
        sewerPicture.image = appointment.sewer.sewerPicture
        sewerName.text = appointment.sewer.sewerName
        ratingLabel.text = rating
        worksLabel.text = sewerWorks
        toDoLabel.text = toDolabel
    }
    
    func setNextAppointmentBehaviour() {
        bannerView.backgroundColor = nextAppointmentBannerColor
        dateHourIndicationLabel.textColor = UIColor.white
    }
    
    func setLastAppointmentBehaviour() {
        bannerView.backgroundColor = lastAppointmentBannerColor
        dateHourIndicationLabel.textColor = UIColor.black
    }
    
    func setToConfirmBehaviour() {
        tagWrapper.isHidden = false
    }
}
