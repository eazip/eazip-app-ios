//
//  OnBoardingPageViewController.swift
//  Eazip
//
//  Created by Marie on 26/05/2019.
//  Copyright © 2019 Eazip. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var pageViewController : UIPageViewController!
    
    enum Slide : String {
        case clothes = "clothes"
        case services = "services"
        case sewers = "sewers"
        case appointment = "appointment"
    }
    
    lazy var orderedViews = {
        return [
           Slide.clothes,
           Slide.services,
           Slide.sewers,
           Slide.appointment
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setEazipGradient(colors: [UIColor(named: "peachColor")!, UIColor(named: "lightPeachColor")!])
        initPageViewController()
    }
    
    func initPageViewController() {
        pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "OnBoardingPageViewController") as! UIPageViewController
        self.pageViewController.dataSource = self
        self.pageViewController.delegate = self
        let pageContentViewController = self.viewControllerAtIndex(index: 0)
        self.pageViewController.setViewControllers([pageContentViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
  
        self.addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view)
        self.pageViewController.didMove(toParentViewController: self)
    }
    
    func viewControllerAtIndex(index: Int) -> OnBoardingPageContentViewController {
        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "OnBoardingPageContentViewController") as! OnBoardingPageContentViewController
        setSlide(controller: pageContentViewController, slide: orderedViews()[index].rawValue)
        pageContentViewController.pageIndex = index
        pageContentViewController.totalNumberOfPages = orderedViews().count
        
        return pageContentViewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! OnBoardingPageContentViewController).pageIndex!
        if index <= 0 {
            return nil
        }
        index -= 1
        
        return self.viewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! OnBoardingPageContentViewController).pageIndex!
        index += 1
        if index >= orderedViews().count {
            return nil
        }
        return self.viewControllerAtIndex(index: index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return orderedViews().count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func setSlide(controller: OnBoardingPageContentViewController, slide: String) {
        switch slide {
        case "clothes":
            setClotheSlide(pageContentViewController: controller)
        case "services":
            setServicesSlide(pageContentViewController: controller)
        case "sewers":
            setSewersSlide(pageContentViewController: controller)
        case "appointment":
            setAppointmentSlide(pageContentViewController: controller)
        default:
            setAppointmentSlide(pageContentViewController: controller)
        }
    }

    func setClotheSlide(pageContentViewController: OnBoardingPageContentViewController) {
        pageContentViewController.dataPageImage = UIImage(named: "clothes_guide")
        pageContentViewController.dataPageLabel = "Vêtements"
        pageContentViewController.dataPageMainText = "Choisissez le où les vetements à retoucher. Vous retrouverez sur l’application plusieurs types de vetements différents."
    }
    
    func setServicesSlide(pageContentViewController: OnBoardingPageContentViewController) {
        pageContentViewController.dataPageImage = UIImage(named: "services_guide")
        pageContentViewController.dataPageLabel = "Retouches"
        pageContentViewController.dataPageMainText = "Choisissez les retouches disponibles en fonction des vetements que vous avez choisis."
    }
    
    func setSewersSlide(pageContentViewController: OnBoardingPageContentViewController) {
        pageContentViewController.dataPageImage = UIImage(named: "sewers_guide")
        pageContentViewController.dataPageLabel = "Couturiers"
        pageContentViewController.dataPageMainText = "Choisissez le couturier de votre choix parmis une liste de plusieurs centaine de professionels"
    }
    
    func setAppointmentSlide(pageContentViewController: OnBoardingPageContentViewController) {
        pageContentViewController.dataPageImage = UIImage(named: "appointments_guide")
        pageContentViewController.dataPageLabel = "Rendez-vous"
        pageContentViewController.dataPageMainText = "Proposez un rendez-vous à votre couturier afin de finaliser votre demande de retouche."
    }
}
