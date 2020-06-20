//
//  HomePresenter.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 19/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation

protocol HomePresenterView: class {
    func update(items: [LocationItem])
    func setupNavigationBar()
}

class HomePresenter: NSObject {
    var manager: LocationManager
    weak var view: HomePresenterView?
    init(manager: LocationManager, with view: HomePresenterView, route: HomeRoute) {
        self.manager = manager
        self.view = view
    }
    
    func viewDidLoad() {
        view?.setupNavigationBar()
        manager.fetch { [weak self] result in
            guard let strongSelf = self else {
                return
            }
            switch result {
                
            case .success(let locations):
                strongSelf.view?.update(items: locations.listLocations.enumerated().map({ LocationItem.mapping(model: $0.element, index: $0.offset)}))
            case .failure(let error):
                print(error.errorDescription)
            }
        }
    }
    
    
}
