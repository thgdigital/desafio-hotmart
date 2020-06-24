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
        
        manager.findLocation(id: idLocation) { [weak self] result in
           guard let strongSelf = self else {
                return
            }
            
            switch result {
                
            case .success(let model):
                let photosUrls = strongSelf.photosType.map({ LocationItem.mapppingImage(type: $0)})
                let about = model.about
                let infos = [
                    InfoItem(image: "time", text: "seg a sex: 7h às 23h \n sáb e dom: 8h às 20h"),
                    InfoItem(image: "phone", text: model.phone),
                    InfoItem(image: "pin", text: model.adress)
                    
                ]
                let reviews = [
                    ReviewItem(avatar: "https://loremflickr.com/g/320/240/people", title: "Fantástico!!", subTitle: "Tortas deliciosas. Os waffles também estavam muito bons. Equipe muito atenciosa. :)", adress: "Tomás Montenegro, Belo Horizonte - MG", rating: 5),
                    ReviewItem(avatar: "https://loremflickr.com/g/320/240/people", title: "Café da manhã delicioso", subTitle: "Nós fomos para o brunch e estava realmente delicioso. Pães, ovos, café, sucos naturais. Não é muito barato mas vale a pena.", adress: "Glória Ruiz, São João Del Rey - MG", rating: 4),
                    ReviewItem(avatar: "https://loremflickr.com/g/320/240/people", title: "Ótima comida", subTitle: "Comidas frescas e de boa qualidade. Pães e quitandas saindo do forno toda hora. Cafés especiais e ambiente agradável.", adress: "Shirley Jones, Mountain View - CA", rating: 4),
                ]
                let sections = [
                    SectionDetailHeader(items: [HeaderItem(item: model)]),
                    SectionGallery(items: photosUrls, name: "Fotos"),
                    SectionAbout(items: [about], name: "Sobre"),
                    SectionInfo(items: infos),
                    SectionReviews(items: reviews, name: "REVIEWS")
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
