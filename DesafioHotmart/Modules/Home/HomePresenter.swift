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
    fileprivate var manager: LocationManager
    weak var view: HomePresenterView?
    var route: HomeRoute
    var imageEmpty: UIImage = #imageLiteral(resourceName: "icoAlert")
    var title: String = "Sem conexão"
    var message: String = ""
    var titleButton: String = ""
    var isLoading: Bool = false
    
    init(manager: LocationManager, with view: HomePresenterView, route: HomeRoute) {
        self.manager = manager
        self.view = view
        self.route = route
    }
    
    func viewDidLoad() {
        fetch()
    }
    var imageAnimation: CAAnimation? {
        let animation = CABasicAnimation.init(keyPath: "transform")
        animation.fromValue = NSValue.init(caTransform3D: CATransform3DIdentity)
        animation.toValue = NSValue.init(caTransform3D: CATransform3DMakeRotation(.pi/2, 0.0, 0.0, 1.0))
        animation.duration = 0.25
        animation.isCumulative = true
        animation.repeatCount = MAXFLOAT
        
        return animation;
    }
    
    func fetch() {
        isLoading = true
        imageEmpty = #imageLiteral(resourceName: "loading_imgBlue_78x78")
        title = ""
        message = ""
        view?.updateCollection(viewModel: HomeViewModel(title: title, message: message, imageEmpty: imageEmpty, isLoading: isLoading, titleButton: ""))
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
        switch error {
        case .jsonDecoding, .unknown, .http:
            imageEmpty = #imageLiteral(resourceName: "icoCloud")
            title = "Error Serve"
            message = "Error no servidor por favor tente mais tarde"
        case .timeout, .noConnection:
            title = "Falha conexão"
            imageEmpty = #imageLiteral(resourceName: "icoWifi")
            message = "Verifique sua conexão com a internet e tente novamente"
            isLoading = false
        }
        titleButton = "Tentar Novamente"
        view?.updateCollection(viewModel: HomeViewModel(title: title, message: message, imageEmpty: imageEmpty, isLoading: isLoading, titleButton: titleButton))
    }
    
    func didSelected(id: Int) {
        route.showDetail(id: id)
    }
    
    func updateView(){
        view?.setupNavigationBar()
    }
}
