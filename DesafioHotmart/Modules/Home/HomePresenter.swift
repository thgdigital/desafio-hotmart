//
//  HomePresenter.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 19/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation

protocol HomePresenterView: class {
    func loading()
    func stopLoading()
    func update(items: [LocationItem])
    func setupNavigationBar()
    func showAlertError(title: String, message: String)
}

class HomePresenter: NSObject {
    var manager: LocationManager
    weak var view: HomePresenterView?
    var route: HomeRoute
    
    init(manager: LocationManager, with view: HomePresenterView, route: HomeRoute) {
        self.manager = manager
        self.view = view
        self.route = route
    }
    
    func viewDidLoad() {
        fetch()
    }
    
    func fetch() {
        manager.fetch { [weak self] result in
            guard let strongSelf = self else {
                return
            }
            switch result {
                
            case .success(let locations):
                strongSelf.view?.update(items: locations.listLocations.enumerated().map({ LocationItem.mapping(model: $0.element, index: $0.offset)}))
            case .failure(let error):
                strongSelf.connectionFailure(with: error)
            }
        }
    }
    
    func connectionFailure(with error: NetworkError) {
        var title = "Sem conexão"
        switch error {
        case .jsonDecoding, .unknown, .http:
            title = "Error Serve"
            self.view?.showAlertError(title: title, message: "Error no servidor por favor tente mais tarde")
        case .timeout:
            self.view?.showAlertError(title: title, message: "Verifique sua conexão com a internet e tente novamente")
        case .noConnection:
            self.view?.showAlertError(title: title, message: "Verifique sua conexão com a internet e tente novamente")
        }
    }
    
    func didSelected(id: Int) {
        route.showDetail(id: id)
    }
    
    func updateView(){
        view?.setupNavigationBar()
    }
}
