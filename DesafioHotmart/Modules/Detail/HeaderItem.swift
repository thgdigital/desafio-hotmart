//
//  HeaderItem.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 23/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

struct HeaderItem {
    var image: String = ""
    var name: String = ""
    var rewies: Double = 1.0
    
    init(model: DetailModel) {
        image = LocationItem.mapppingImage(type: model.type)
        name = model.name
        rewies = model.review
    }
}
