//
//  SewerProfilePage.swift
//  Eazip
//
//  Created by Marie on 26/03/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class SewersViewPageController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var sewerProfileCollectionView : UICollectionView?
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
        layout.itemSize = CGSize(width: screenWidth , height: screenWidth / 2)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        
        //Data
        let dataSewer : SewerProfile = getSewer()
        let pictureView = setUpPictureView(picture: dataSewer.sewerPicture, name: dataSewer.sewerName, rating: dataSewer.sewerRating)
        profileViewCategories.append(pictureView)
    }
    
    func getSewer() -> SewerProfile {
        let works : [UIImage] = [UIImage(named:"sewerPicture2")!, UIImage(named:"sewerPicture2")!,UIImage(named:"sewerPicture2")!]
        let reviews : [SewerReview] = [SewerReview(author: "Toto", textContent: "Haec igitur prima lex amicitiae sanciatur, ut ab amicis honesta petamus, amicorum causa honesta faciamus. Ut ab amicis honesta petamus, amicorum causa honesta faciamus", rating: 3),SewerReview(author: "Titi", textContent: "Haec igitur prima lex amicitiae sanciatur, ut ab amicis honesta petamus, amicorum causa honesta faciamus. Ut ab amicis honesta petamus, amicorum causa honesta faciamus", rating: 4)]
        
        let sewer = SewerProfile(picture: UIImage(named:"sewerPicture2")!, name: "Minouce", rating: 3, works: works, reviews: reviews)
        
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}
