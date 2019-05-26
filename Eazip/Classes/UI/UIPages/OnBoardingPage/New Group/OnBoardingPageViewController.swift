//
//  OnBoardingPageViewController.swift
//  Eazip
//
//  Created by Marie on 26/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
   
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var logoFerrandinetitle: EazipLabel!
    @IBOutlet weak var pageMainText: UILabel!
    @IBOutlet weak var pageLabel: EazipLabel!
    @IBOutlet weak var pageImage: UIImageView!
    
    let titlesToDisplay = ["Vêtements", "Retouches", "Couturiers", "Rendez-vous"]
    let textToDisplay = ["Choisissez le où les vetements à retoucher. Vous retrouverez sur l’application plusieurs types de vetements                  différents.", "Choisissez les retouches disponibles en fonction des vetements que vous avez choisis.", "Choisissez le couturier de votre choix parmis une liste de plusieurs centaine de professionels", "Proposez un rendez-vous à votre couturier afin de finaliser votre demande de retouche."]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setUpUI() {
        mainView.setEazipGradient(colors: [UIColor(named: "peachColor")!, UIColor(named: "lightPeachColor")!])
        logoFerrandinetitle.textColor = .white
        pageLabel.textColor = .white
        pageMainText.textColor = .white
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return titlesToDisplay.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
