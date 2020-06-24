//
//  SectionReviews.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 24/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class SectionReviews: Sections {
    
    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        ReviewCell.self
    }
    
    override func willDisplayCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {
        if let reviewCell = cell as? ReviewCell, let item = items[indexPath.row] as? ReviewItem {
            reviewCell.configure(item: item)
        }
    }
}
