//
//  SewerProfilePage.swift
//  Eazip
//
//  Created by Marie on 26/03/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class SewerProfilePageController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    @IBOutlet var sewerProfileCollectionView: UICollectionView?
    //Data
    let dataSewer = SewerProfile()
    var profileSections : Int = 0
    var reviewsSection : [SewerReview] = []

    override func viewDidLoad() {
        //Layout content position
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        
        sewerProfileCollectionView?.delegate = self
        sewerProfileCollectionView?.dataSource = self
        
        setUpPictureView()
        setUpDescriptionView()
        setUpLastWorksView()
        reviewsSection = setUpReviewView(reviews: dataSewer.sewerReviews)
    }
    
    func setUpPictureView() {
        sewerProfileCollectionView?.register(UINib(nibName:"PictureViewCell", bundle: nil), forCellWithReuseIdentifier: "PictureViewCell")
        profileSections = profileSections + 1
    }
    
    func setUpDescriptionView() {
        sewerProfileCollectionView?.register(UINib(nibName:"DescriptionViewCell", bundle: nil), forCellWithReuseIdentifier: "DescriptionViewCell")
        profileSections = profileSections + 1
    }
    
    func setUpLastWorksView(){
        sewerProfileCollectionView?.register(UINib(nibName:"LastWorksViewCell", bundle: nil), forCellWithReuseIdentifier: "LastWorksViewCell")
        profileSections = profileSections + 1
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
        return (section == 0) ? profileSections : reviewsSection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let categoryIndex = indexPath.row
            switch(categoryIndex) {
                case 0:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureViewCell", for: indexPath) as! PictureViewCell
                    cell.setData(picture: dataSewer.sewerPicture, name: dataSewer.sewerName, rating: dataSewer.sewerRating)
                    
                    return cell
                case 1:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DescriptionViewCell", for: indexPath) as! DescriptionViewCell
                    cell.setData(biography: dataSewer.sewerBiography)
                    
                    return cell
                case 2:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LastWorksViewCell", for: indexPath) as! LastWorksViewCell
                    cell.setData(works: dataSewer.sewerWorks as! [UIImage])
                    
                    return cell
                default:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureViewCell", for: indexPath) as! PictureViewCell
                    cell.setData(picture: dataSewer.sewerPicture, name: dataSewer.sewerName, rating: dataSewer.sewerRating)
                    
                    return cell
            }
        } else {
            let reviewIndex = indexPath.row
            let review = reviewsSection[reviewIndex]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReviewViewCell", for: indexPath) as! ReviewViewCell
            cell.setData(rating: review.rating, textContent: review.textContent, author: review.author)
            
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
