//
//  LocationItem.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 19/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import  UIKit

class LocationItem {
    var title: String = ""
    var subTitle: String = ""
    var rewies: Double = 1.0
    var color: UIColor = .white
    var cellSizes: CGSize = .zero
    
    static func mapping(model: LocationModel, index: Int) -> LocationItem {
        let locations: LocationItem = LocationItem()
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
        locations.subTitle = model.type
        return locations
        
    }
}
