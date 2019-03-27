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
        
        //Data
        let dataSewer : SewerProfile = getSewer()
        let pictureView = setUpPictureView(picture: dataSewer.sewerPicture, name: dataSewer.sewerName, rating: dataSewer.sewerRating)
        let descriptionView = setUpDescriptionView(biography: dataSewer.sewerBiography)
        
        for review in dataSewer.sewerReviews {
            print(word)
        }
        
        //init
        profileViewCategories.append(pictureView)
        profileViewCategories.append(descriptionView)
        
        sewerProfileCollectionView?.register(UINib(nibName:"PictureViewCell", bundle: nil), forCellWithReuseIdentifier: "PictureViewCell")
        sewerProfileCollectionView?.register(UINib(nibName:"DescriptionViewCell", bundle: nil), forCellWithReuseIdentifier: "DescriptionViewCell")
        
        
        sewerProfileCollectionView?.delegate = self
        sewerProfileCollectionView?.dataSource = self
    }
    
    func getSewer() -> SewerProfile {
        let works : [UIImage] = [UIImage(named:"sewerPicture2")!, UIImage(named:"sewerPicture2")!,UIImage(named:"sewerPicture2")!]
        let reviews : [SewerReview] = [SewerReview(author: "Toto", textContent: "Haec igitur prima lex amicitiae sanciatur, ut ab amicis honesta petamus, amicorum causa honesta faciamus. Ut ab amicis honesta petamus, amicorum causa honesta faciamus", rating: 3),SewerReview(author: "Titi", textContent: "Haec igitur prima lex amicitiae sanciatur, ut ab amicis honesta petamus, amicorum causa honesta faciamus. Ut ab amicis honesta petamus, amicorum causa honesta faciamus", rating: 4)]
        
        let sewer = SewerProfile(picture: UIImage(named:"sewerPicture2")!, name: "Minouce", rating: 3, biography: "Denique Antiochensis ordinis vertices sub uno elogio iussit occidi ideo efferatus, quod ei celebrari vilitatem intempestivam urgenti, cum inpenderet inopia, gravius rationabili responderunt; et perissent ad unum ni comes orientis tunc Honoratus fixa constantia restitisset.", works: works, reviews: reviews)
        
        return sewer
    }
    
    func setUpPictureView(picture: UIImage, name: String, rating: Int) -> [String: Any] {
        let personalInformation: [String: Any] = [
            "picture": picture,
            "name": name,
            "rating": rating
        ]
       return personalInformation
    }
    
    func setUpDescriptionView(biography: String) -> String {
        
        return biography
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileViewCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
    
        
    }
}
