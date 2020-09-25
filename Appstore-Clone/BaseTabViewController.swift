//
//  BaseTabViewController.swift
//  Appstore-Clone
//
//  Created by Long Nguyễn on 9/25/20.
//

import UIKit

class BaseTabViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let redViewController = UIViewController()
        redViewController.view.backgroundColor = .white
        redViewController.navigationItem.title = "Today"
        
        let redNavigationController = UINavigationController(rootViewController: redViewController)
        redNavigationController.tabBarItem.title = "Today"
        redNavigationController.tabBarItem.image = #imageLiteral(resourceName: "today_icon")
        redNavigationController.navigationBar.prefersLargeTitles = true
        
        let blueViewController = UIViewController()
        blueViewController.view.backgroundColor = .white
        blueViewController.navigationItem.title = "App"
        
        let blueNavigationController = UINavigationController(rootViewController: blueViewController)
        blueNavigationController.tabBarItem.title = "App"
        blueNavigationController.tabBarItem.image = #imageLiteral(resourceName: "apps")
        blueNavigationController.navigationBar.prefersLargeTitles = true

        
        let pinkViewController = UIViewController()
        pinkViewController.view.backgroundColor = .white
        pinkViewController.navigationItem.title = "Search"
        
        let pinkNavigationController = UINavigationController(rootViewController: pinkViewController)
        pinkNavigationController.tabBarItem.title = "Search"
        pinkNavigationController.tabBarItem.image = #imageLiteral(resourceName: "search")
        pinkNavigationController.navigationBar.prefersLargeTitles = true

        
        viewControllers = [
            redNavigationController,
            blueNavigationController,
            pinkNavigationController
        ]
    }
}
