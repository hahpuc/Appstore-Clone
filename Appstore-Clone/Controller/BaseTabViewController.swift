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
                
        viewControllers = [
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
            createNavController(viewController: UIViewController(), title: "App", imageName: "apps_icon"),
            createNavController(viewController: AppSearchController(), title: "Search", imageName: "search_icon"),
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        navController.navigationBar.prefersLargeTitles = true;
        
        return navController
    }
    
}
