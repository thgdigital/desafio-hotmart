//
//  SectionGallery.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 23/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class SectionGallery: Sections {

    override func direction() -> UICollectionView.ScrollDirection {
        .horizontal
    }
    
    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        BoxCell.self
    }
    
    override func header() -> CollectionViewHeader.Type? {
        CollectionViewHeader.self
    }
    
    override func willDisplayCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {
        if let cell = cell as? BoxCell {
            cell.items = items
        }
    }
    override func getCellSize(_ cell: CollectionViewCell.Type, for indexPath: IndexPath) -> CGSize {
           .init(width: UIScreen.main.bounds.width, height: 65)
       }
    
    override func willDisplayHeader(_ headerView: CollectionViewHeader) {
        headerView.configure(title: name)
    }
}
