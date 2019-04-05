//
//  SewerAvailabilityViewController.swift
//  Eazip
//
//  Created by Marie on 04/04/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class SewerAvailabilityViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {

    @IBOutlet weak var datePickerCollectionView: UICollectionView!
    
    let dataDate : [[String: String]] = [
        ["day": "Lundi", "dayNb": "26"],
        ["day": "Mardi", "dayNb": "27"],
        ["day": "Mercredi", "dayNb": "28"],
        ["day": "Jeudi", "dayNb": "29"],
        ["day": "Vendredi", "dayNb": "30"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCollectionViewLayout()
        initDatePickerCell(cellIdentifier: "DatePickerViewCell")
    }
    
    func initDatePickerCell(cellIdentifier: String) {
        datePickerCollectionView?.register(UINib(nibName:cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }
    
    func initCollectionViewLayout() {
        //Init delegate and datasource
        datePickerCollectionView?.delegate = self
        datePickerCollectionView?.dataSource =  self
        datePickerCollectionView?.showsHorizontalScrollIndicator = false
        
        //Layout content position
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 12
        layout.itemSize = CGSize(width: 70, height: 70)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        datePickerCollectionView?.collectionViewLayout = layout
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        return dataDate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let date = dataDate[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DatePickerViewCell", for: indexPath) as! DatePickerViewCell
        
        let dateNb = date["dayNb"]
        let dateDay = String(Array(date["day"] ?? "")[0..<3])
        cell.setData(dayNb: dateNb!, dayTitle: dateDay)
        
        return cell
    }
    
    /*func collectionView(_ collectionView: UICollectionView, didSelectRowAt indexPath: IndexPath) {
     
     }*/
}
