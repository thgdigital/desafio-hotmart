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
    var review: Double = 1.0
    
    init(item: DetailItem) {
        image = LocationItem.mapppingImage(type: item.type)
        name = item.name
        review = item.review
    }
}
