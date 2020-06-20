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
    func makeScreen() -> HomeListView {
        let homelistView = HomeListView(collectionViewLayout: CollectionViewWaterfallLayout())
        homelistView.presenter = HomePresenter(manager: LocationManager(), with: homelistView, route: self)
        viewController = homelistView
        return homelistView
    }
}
