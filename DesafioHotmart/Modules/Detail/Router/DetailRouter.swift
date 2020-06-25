//
//  DetailRouter.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 23/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class DetailRouter {
    weak var viewController: UIViewController?
    
    func makeScreen(idLocation: Int) -> DetailViewController {
        let detailController = DetailViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let presenter = DetailPresenter(idLocation: idLocation, manager: LocationManager(), view: detailController)
        detailController.presenter = presenter
        return detailController
    }
}
