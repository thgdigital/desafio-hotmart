//
//  LocationItem.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 19/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import  UIKit

class LocationItem {
    var id: Int = 0
    var title: String = ""
    var subTitle: String = ""
    var rewies: Double = 1.0
    var color: UIColor = .white
    var cellSizes: CGSize = .zero
    var image: String = ""
    
    static func mapping(model: LocationModel, index: Int) -> LocationItem {
        let locations: LocationItem = LocationItem()
        locations.id = model.id
        locations.cellSizes = .init(width: 140, height: Int.random(in: 180..<240))
        if index.isMultiple(of: 2){
            locations.color = .colorBlue
        } else if index.isMultiple(of: 3) {
            locations.color = .colorCreme
        } else {
            locations.color = .colorPink
        }
        locations.rewies = model.review
        locations.title = model.name
        locations.subTitle = model.type.rawValue
        locations.image = mapppingImage(type: model.type)
        
        return locations
        
    }
    
    static func mapppingImage(type: LocationType) -> String {
        var image = ""
        switch type {
        case .barbearia:
            image = "https://loremflickr.com/g/320/240/barbershop"
        case .bares:
            image = "https://loremflickr.com/g/320/240/bars"
        case .cafeteria:
            image = "https://loremflickr.com/g/320/240/coffee%20shop"
        case .coworking:
            image = "https://loremflickr.com/g/320/240/coworking"
        case .padaria:
            image = "https://loremflickr.com/g/320/240/bakehouse"
        case .produtosNaturais:
            image = "https://loremflickr.com/g/320/240/Natural%20products"
        case .restaurante:
            image = "https://loremflickr.com/g/320/240/restaurant"
        case .sucosNaturais:
            image = "https://loremflickr.com/g/320/240/natural%20juices"
        case .supermercado:
            image = "https://loremflickr.com/g/320/240/supermarket"
        }
        return  image
    }
}
