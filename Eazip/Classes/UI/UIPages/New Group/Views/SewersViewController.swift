//
//  SewersViewController.swift
//  Eazip
//
//  Created by Marie on 29/01/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class SewersViewController: UIViewController {
    
    @IBOutlet var sewerCollectionView : UICollectionView?
    
    var collectionView: UICollectionView?
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    var dataSewers : [Sewer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getSewersData()
    }
    
    func getSewersData() {
        ApiSewersHelper() { sewerList, error in
            if sewerList != nil {
                self.dataSewers.append(contentsOf: sewerList!)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self.initSewerCollectionView()
                }
            }
        }
    }
    
    typealias Apicompletion = (_ sewerList: [Sewer]?, _ errorString: String?) -> Void
    
    func ApiSewersHelper(completion: @escaping Apicompletion) {
        let url = URL(string: "http://ec2-35-180-118-48.eu-west-3.compute.amazonaws.com/sewers")
        let session = URLSession.shared
        
        session.dataTask(with: url!) { (data, response, error) in
            var tempSewerList: [Sewer] = []
            
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        if let sewerArray = json["data"] as? NSArray {
                            for sewer in sewerArray as! [Dictionary<String, AnyObject>] {
                                print("sewer", sewer)
                                let id = sewer["id"] as! Int
                                let firstName = sewer["first_name"] as! String
                                let lastName = sewer["last_name"] as! String
                                let picture = "sewerPicture1"
                                let works = 3
                                
                                tempSewerList.append(Sewer(img: UIImage(named: picture)!, name: firstName, rating: 3, works: works))
                            }
                            completion(tempSewerList, nil)
                        }
                    }
                } catch {
                    completion(nil, error.localizedDescription)
                }
            }
        }.resume()
    }
    
    func createSewersArray() -> [Sewer] {
        var sewerList : [Sewer] = []
        
        let sewer1 = Sewer(img: UIImage(named:"sewerPicture1")!, name: "Amélie", rating: 4, works: 3)
        let sewer2 = Sewer(img: UIImage(named:"sewerPicture2")!, name: "Joseph", rating: 4, works: 10)
        let sewer3 = Sewer(img: UIImage(named:"sewerPicture3")!, name: "Nina", rating: 4, works: 18)
        let sewer4 = Sewer(img: UIImage(named:"sewerPicture1")!, name: "Alice", rating: 4, works: 34)
        let sewer5 = Sewer(img: UIImage(named:"sewerPicture2")!, name: "Pierre-Emanuel", rating: 4, works: 19)
        let sewer6 = Sewer(img: UIImage(named:"sewerPicture3")!, name: "Julie", rating: 4, works: 43)
        
        sewerList.append(sewer1)
        sewerList.append(sewer2)
        sewerList.append(sewer3)
        sewerList.append(sewer4)
        sewerList.append(sewer5)
        sewerList.append(sewer6)
        
        return sewerList
    }
    
    func initSewerCollectionView() {
        //Init delegate and datasource
        sewerCollectionView?.delegate = self
        sewerCollectionView?.dataSource =  self
        
        //Layout content position
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 30
        sewerCollectionView?.collectionViewLayout = layout
    }
}



