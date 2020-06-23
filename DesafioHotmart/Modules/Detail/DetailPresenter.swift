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
    var photosType:[LocationType] = [.barbearia, .bares, .cafeteria, .coworking, .padaria, .produtosNaturais, .restaurante, .sucosNaturais]
    
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
                let photosUrls = strongSelf.photosType.map({ LocationItem.mapppingImage(type: $0)})
                let sections = [
                    SectionDetailHeader(items: [HeaderItem(model: model)]),
                    SectionGallery(items: photosUrls, name: "Fotos")
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
}
