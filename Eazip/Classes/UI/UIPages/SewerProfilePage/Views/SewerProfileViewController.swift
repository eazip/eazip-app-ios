//
//  SewerProfilePage.swift
//  Eazip
//
//  Created by Marie on 26/03/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class SewerProfileViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate, SewerDescriptionViewDelegate {
    
    @IBOutlet weak var sewerProfileCollectionView: UICollectionView!
    
    //Data
    var profileSections : Int = 0
    var reviewsSection : [SewerReview] = []
    var currentProfile: Sewer = Sewer(id: 0, bio: "", img: UIImage(named: "sewerPicture1")!, firstName: "", lastName: "", rating: 0, works: 0, street: "", city: "")
    var dataSewer = SewerProfile(sewerFirstName: "", sewerLastName: "", sewerRating: 0, sewerBiography: "", sewerCity: "", sewerStreet: "")
    override func viewDidLoad() {
        dataSewer = initDataSewer()
        // Init CollectionViewCell Layout
        initLayout()
        
        // Init custum cells
        setUpPictureView()
        setUpDescriptionView()
        setUpLastWorksView()
        setUpReviewView()
        
        sewerProfileCollectionView?.register(UINib(nibName: "ProfileHeaderReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "ProfileHeaderReusableView")
    }
    
    func initDataSewer() -> SewerProfile {
        return SewerProfile(sewerFirstName: currentProfile.sewerFirstName, sewerLastName: currentProfile.sewerLastName, sewerRating: currentProfile.sewerRating, sewerBiography: currentProfile.sewerBio, sewerCity: currentProfile.sewerCity, sewerStreet: currentProfile.sewerStreet)
    }
    
    func initLayout() {
        //Layout content position
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
        layout.itemSize = UICollectionViewFlowLayoutAutomaticSize
        layout.estimatedItemSize = CGSize(width: 1, height:1)
        self.sewerProfileCollectionView?.collectionViewLayout = layout
        
        //Init delegate and datasource
        sewerProfileCollectionView?.delegate = self
        sewerProfileCollectionView?.dataSource = self
    }
    
    func setUpPictureView() {
         initSewerProfileCell(cellIdentifier: "PictureViewCell")
    }
    
    func setUpDescriptionView() {
        initSewerProfileCell(cellIdentifier: "DescriptionViewCell")
    }
    
    func setUpLastWorksView(){
        initSewerProfileCell(cellIdentifier: "LastWorksViewCell")
    }
    
    func setUpReviewView() {
        let dataReviews = dataSewer.sewerReviews
        for _ in dataReviews {
            sewerProfileCollectionView?.register(UINib(nibName:"ReviewViewCell", bundle: nil), forCellWithReuseIdentifier: "ReviewViewCell")
        }
        reviewsSection = dataReviews
    }
    
    func initSewerProfileCell(cellIdentifier: String) {
        sewerProfileCollectionView?.register(UINib(nibName:cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        profileSections = profileSections + 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (section == 0) ? profileSections : reviewsSection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size : CGSize
        if indexPath.section == 0 {
            size = CGSize(width: (sewerProfileCollectionView?.frame.width)!, height: 500)
            return size
        } else {
            size = CGSize(width: (sewerProfileCollectionView?.frame.width)!-30, height: 250)
            return size
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let viewModel = SewerProfileScreen(data: dataSewer)
            let itemsInView = viewModel.templateWithData()
            let item = itemsInView[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: type(of: item).reuseId, for: indexPath)
            item.configure(cell: cell)
            
            // ViewCell de la description du couturier
            if indexPath.row == 1 {
                let ccell = collectionView.dequeueReusableCell(withReuseIdentifier: "DescriptionViewCell", for: indexPath as IndexPath) as! DescriptionViewCell
                ccell.delegate = self
                ccell.setData(biography: dataSewer.sewerBiography)
                
                return ccell
            }
        
            return cell
        } else {
            let reviewIndex = indexPath.row
            let review = reviewsSection[reviewIndex]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReviewViewCell", for: indexPath) as! ReviewViewCell
            cell.setData(rating: review.rating, textContent: review.textContent, author: review.author)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            case UICollectionElementKindSectionHeader:
                let sectionTitle = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "ProfileHeaderReusableView", for: indexPath) as! ProfileHeaderReusableView
                sectionTitle.setData(reviewsCount: reviewsSection.count)
                
                return sectionTitle
            
            default:
                fatalError("No Reusable view")
        }
        
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
    
    func checkSewerAvailabilities() {
        performSegue(withIdentifier: "currentSewerAvailability", sender: self)
        goToScreen(identifier: "SewerAvailabilityViewController")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SewerAvailabilityViewController
        vc.self.currentProfile = currentProfile
    }
}
