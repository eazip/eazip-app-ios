//
//  SewerProfilePage.swift
//  Eazip
//
//  Created by Marie on 26/03/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class SewerProfilePageController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var sewerProfileCollectionView: UICollectionView?
   
    var profileViewCategories : Array<Any> = []
    var reviewsViews : [SewerReview] = []
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    override func viewDidLoad() {
        //Screen properties
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.size.width
        screenHeight = screenSize.height
        
        //Layout content position
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        
        sewerProfileCollectionView?.delegate = self
        sewerProfileCollectionView?.dataSource = self
        
        //Data
        let dataSewer = SewerProfile()

        //Sections
        let pictureView = setUpPictureView(picture: dataSewer.sewerPicture, name: dataSewer.sewerName, rating: dataSewer.sewerRating)
        let descriptionView = setUpDescriptionView(biography: dataSewer.sewerBiography)
        
        //Init sections
        profileViewCategories.append(pictureView)
        profileViewCategories.append(descriptionView)
        
        reviewsViews = setUpReviewView(reviews: dataSewer.sewerReviews)

    }
    
    func setUpPictureView(picture: UIImage, name: String, rating: Int) -> [String: Any] {
        sewerProfileCollectionView?.register(UINib(nibName:"PictureViewCell", bundle: nil), forCellWithReuseIdentifier: "PictureViewCell")
        
        let personalInformation: [String: Any] = [
            "picture": picture,
            "name": name,
            "rating": rating
        ]
        
       return personalInformation
    }
    
    func setUpDescriptionView(biography: String) -> String {
        sewerProfileCollectionView?.register(UINib(nibName:"DescriptionViewCell", bundle: nil), forCellWithReuseIdentifier: "DescriptionViewCell")
        
        return biography
    }
    
    func setUpReviewView(reviews: [SewerReview]) -> [SewerReview] {
        for _ in reviews {
            sewerProfileCollectionView?.register(UINib(nibName:"ReviewViewCell", bundle: nil), forCellWithReuseIdentifier: "ReviewViewCell")
        }
        
        return reviews
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (section == 0) ? profileViewCategories.count : reviewsViews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let categoryIndex = indexPath.row
            let categoryData = profileViewCategories[categoryIndex]
            
            switch(categoryIndex) {
                case 0:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureViewCell", for: indexPath) as! PictureViewCell
                    cell.setData()
                    return cell
                case 1:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DescriptionViewCell", for: indexPath) as! DescriptionViewCell
                    cell.setData()
                    return cell
                default:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureViewCell", for: indexPath) as! PictureViewCell
                    cell.setData()
                    return cell
            }
        } else {
            let reviewIndex = indexPath.row
            let reviewData = reviewsViews[reviewIndex]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReviewViewCell", for: indexPath) as! ReviewViewCell
            
            cell.setData()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       
        let sectionTitle = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "profileSectionTitle", for: indexPath) as! ProfileSectionTitle
        sectionTitle.setData()
        
        return sectionTitle
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
            return CGSize(width: 0, height: 0)
        case 1:
            return CGSize(width: collectionView.bounds.width, height: 70)
        default:
            return CGSize(width: collectionView.bounds.width, height: 70)
        }
    }
}
