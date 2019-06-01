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
    
    func ApiSewersHelper(completion: Apicompletion?) {
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
                            completion?(tempSewerList, nil)
                        }
                    }
                } catch {
                    completion?(nil, error.localizedDescription)
                }
            }
        }.resume()
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



