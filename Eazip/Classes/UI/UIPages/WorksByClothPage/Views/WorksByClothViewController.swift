//
//  WorksByClothViewController.swift
//  Eazip
//
//  Created by Marie on 11/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class WorksByClothViewController: UIViewController {

    @IBOutlet weak var worksByClothCollectionView: UICollectionView!
    @IBOutlet weak var validationButton: ColoredActionButton!
    
    var navigationAllowed : Bool = true
    var selectedServices : [[String : Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initWorksByClothCollectionView()
        worksByClothCollectionView.layoutIfNeeded()
        setUpValidationButton()
    }
    
    func initWorksByClothCollectionView() {
        //Init cell
        setUpClothView()
        
        //Init delegate and datasource
        worksByClothCollectionView?.delegate = self
        worksByClothCollectionView?.dataSource =  self
        
        //Layout content position
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.itemSize = UICollectionViewFlowLayoutAutomaticSize
        layout.estimatedItemSize = CGSize(width: 1, height:1)
        
        worksByClothCollectionView?.collectionViewLayout = layout
    }

    func setUpClothView() {
        initClothSectionCell(cellIdentifier: "ClothDetailsViewCell")
    }
    
    func initClothSectionCell(cellIdentifier: String) {
        worksByClothCollectionView?.register(UINib(nibName:cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }
    
    func setUpValidationButton()  {
        validationButton?.setTitle("Chercher un(e) couturier(e)", for: .normal)
    }
    
    func toggleNavigationAvailability() {
        if selectedServices.count == 0 {
            makeNextStepUnavailable()
        } else {
            makeNextStepAvailable()
        }
    }
    
    func makeNextStepUnavailable() {
        navigationAllowed = false
        validationButton?.alpha = 0.30
    }
    
    func makeNextStepAvailable() {
        navigationAllowed = true
        validationButton?.alpha = 1
    }
    
    @IBAction func next(_ sender: Any) {
        nextStep()
    }
    
    func nextStep() -> Void {
        if navigationAllowed {
            goToScreen(identifier: "SewersViewController")
        }
    }
}
