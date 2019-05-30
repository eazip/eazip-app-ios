//
//  OnBoardingPageContentViewController.swift
//  Eazip
//
//  Created by Marie on 27/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class OnBoardingPageContentViewController: UIViewController {
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var logoFerrandinetitle: EazipLabel!
    @IBOutlet weak var pageMainText: UILabel!
    @IBOutlet weak var pageLabel: EazipLabel!
    @IBOutlet weak var pageImage: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var startButton: WhiteActionButton!
    
    var pageIndex: Int!
    var dataPageLabel : String!
    var dataPageMainText : String!
    var dataPageImage : UIImage!
    var totalNumberOfPages : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setData()
        if pageIndex == totalNumberOfPages - 1 {
            makeStartButtonAppear()
        }
    }
    
    func setupUI() {
        mainView.setEazipGradient(colors: [UIColor(named: "peachColor")!, UIColor(named: "lightPeachColor")!])
        logoFerrandinetitle.textColor = .white
        pageLabel.textColor = .white
        pageMainText.textColor = .white
        pageLabel.textAlignment = .center
        pageMainText.textAlignment = .center
    }
    
    func setData() {
        pageImage.image = dataPageImage
        pageLabel.text = dataPageLabel
        pageMainText.text = dataPageMainText
        pageControl.numberOfPages = totalNumberOfPages
        pageControl.currentPage = pageIndex
    }
    
    func makeStartButtonAppear() {
        self.startButton.isHidden = false
    }
    @IBAction func startApplication(_ sender: Any) {
        goToScreen(identifier: "WelcomePageController")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
