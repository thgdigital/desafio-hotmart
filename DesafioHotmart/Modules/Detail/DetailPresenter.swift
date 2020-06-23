//
//  DetailPresenter.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 23/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation


class DetailPresenter: NSObject {
    var manager: LocationManager
    var idLocation: Int
    weak var view: DetailPresenterView?
    
    init(idLocation: Int, manager: LocationManager, view: DetailPresenterView) {
        self.idLocation = idLocation
        self.manager = manager
        self.view = view
    }
    
    func fetchLocation() {
        view?.setupNavigationBar()
        manager.findLocation(id: idLocation) { [weak self] result in
           guard let strongSelf = self else {
                return
            }
            
            switch result {
                
            case .success(let model):
                let sections = [
                    SectionDetailHeader(items: [HeaderItem(model: model)])
                ]
                strongSelf.view?.update(sections: sections)
            case .failure(let error):
                print(error)
            }
        }
    }
}
protocol DetailPresenterView: class {
    func update(sections: [Sections])
    func setupNavigationBar()
}
