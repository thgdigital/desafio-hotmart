//
//  TabBarRoute.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 25/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class TabBarRoute {
    
    func makeScreen() -> TabBarController {
        let tabBarController = TabBarController()
        tabBarController.viewControllers = [
            HomeRoute().makeScreen(),
            makeNavigationControler(viewcontroller: UIViewController(), image: #imageLiteral(resourceName: "mapOff"), selectedImage: #imageLiteral(resourceName: "mapOn")),
            makeNavigationControler(viewcontroller: UIViewController(), image: #imageLiteral(resourceName: "profileOff"), selectedImage: #imageLiteral(resourceName: "profileOn"))
        ]
        return tabBarController
    }
    
    fileprivate func makeNavigationControler(viewcontroller: UIViewController, image: UIImage?, selectedImage: UIImage?) -> UINavigationController {
        let tabBarItem = UITabBarItem(title: "", image: image, selectedImage: selectedImage)
        tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        viewcontroller.tabBarItem = tabBarItem
        viewcontroller.view.backgroundColor = .white
        let navigation = UINavigationController(rootViewController: viewcontroller)
        return navigation
    }
}
