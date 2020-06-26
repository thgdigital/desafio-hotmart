//
//  HomePresenter.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 19/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

protocol HomePresenterView: class {
    func update(items: [LocationItem])
    func setupNavigationBar()
    func updateCollection(viewModel: HomeViewModel)
}

class HomePresenter: NSObject {
    var manager: LocationManager
    weak var view: HomePresenterView?
    var route: HomeRoute
    var viewModel: HomeViewModel
    
    init(manager: LocationManager, with view: HomePresenterView, route: HomeRoute) {
        self.manager = manager
        self.view = view
        self.route = route
        self.viewModel = HomeViewModel(title: "Carregando", message: "", imageEmpty: #imageLiteral(resourceName: "loading_imgBlue_78x78"), isLoading: true, titleButton: "")
    }
    
    func viewDidLoad() {
        fetch()
    }
    
    func fetch() {
        viewModel.isLoading = true
        viewModel.imageEmpty = #imageLiteral(resourceName: "loading_imgBlue_78x78")
        viewModel.title = ""
        viewModel.message = ""
        view?.updateCollection(viewModel: viewModel)
        manager.fetch { [weak self] result in
            guard let strongSelf = self else {
                return
            }
            switch result {
                
            case .success(let locations):
                strongSelf.viewModel.isLoading = false
                strongSelf.viewModel.title = ""
                strongSelf.viewModel.message = ""
                strongSelf.view?.update(items: locations.listLocations.enumerated().map({ LocationItem.mapping(model: $0.element, index: $0.offset)}))
            case .failure(let error):
                strongSelf.connectionFailure(with: error)
            }
        }
    }
    
    func connectionFailure(with error: NetworkError) {
        switch error {
        case .jsonDecoding, .unknown, .http:
            self.viewModel.imageEmpty = #imageLiteral(resourceName: "icoCloud")
            self.viewModel.title = "Error Serve"
            self.viewModel.message = "Error no servidor por favor tente mais tarde"
        case .timeout, .noConnection:
            self.viewModel.title = "Falha conexão"
            self.viewModel.imageEmpty = #imageLiteral(resourceName: "icoWifi")
            self.viewModel.message = "Verifique sua conexão com a internet e tente novamente"
            self.viewModel.isLoading = false
        }
        viewModel.titleButton = "Tentar Novamente"
        view?.updateCollection(viewModel: viewModel)
    }
    
    func didSelected(id: Int) {
        route.showDetail(id: id)
    }
    
    func updateView(){
        view?.setupNavigationBar()
    }
}
