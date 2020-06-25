//
//  HomeRoute.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 19/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit
import CollectionViewWaterfallLayout


class HomeRoute {
    weak var viewController: UIViewController?
    func makeScreen() -> UINavigationController {
        let homelistView = HomeListView(collectionViewLayout: CollectionViewWaterfallLayout())
        homelistView.presenter = HomePresenter(manager: LocationManager(), with: homelistView, route: self)
        viewController = homelistView
        let tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "homeOff"), selectedImage: #imageLiteral(resourceName: "homeOn"))
        tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        homelistView.tabBarItem = tabBarItem
        let navigation = UINavigationController(rootViewController: homelistView)
        let navigationBar  = navigation.navigationBar
        navigationBar.tintColor = .white
        return navigation
    }
    
    func showDetail(id: Int){
        let detail = DetailRouter().makeScreen(idLocation: id)
        viewController?.navigationController?.pushViewController(detail, animated: true)
    }
}
