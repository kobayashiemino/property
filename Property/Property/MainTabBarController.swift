//
//  MainTabBarController.swift
//  Property
//
//  Created by kobayashi emino on 2020/08/23.
//  Copyright © 2020 kobayashi emino. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllers()
    }
    
    func setupViewControllers() {
        let homeViewContoller = templeteNavController(rootViewController: HomeViewController(), selectedImage: "house.fill", unSelectedImage: "house")
        let exploreViewController = templeteNavController(rootViewController: ExploreViewController(), selectedImage: "globe", unSelectedImage: "globe")
        let cameraViewController = templeteNavController(rootViewController: CameraViewController(), selectedImage: "plus", unSelectedImage: "plus")
        let notificationsViewController = templeteNavController(rootViewController: NotificationsViewController(), selectedImage: "bell.fill", unSelectedImage: "bell")
        let profileViewController = templeteNavController(rootViewController: ProfileViewController(), selectedImage: "person.fill", unSelectedImage: "person")
        
        viewControllers = [homeViewContoller,
                           exploreViewController,
                           cameraViewController,
                           notificationsViewController,
                           profileViewController]
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
    
    func templeteNavController(rootViewController: UIViewController = UIViewController(), selectedImage: String, unSelectedImage: String) -> UINavigationController {
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.selectedImage = UIImage(systemName: selectedImage)?.withRenderingMode(.alwaysOriginal)
        navController.tabBarItem.image = UIImage(systemName: unSelectedImage)?.withRenderingMode(.alwaysOriginal)
        return navController
    }
}
