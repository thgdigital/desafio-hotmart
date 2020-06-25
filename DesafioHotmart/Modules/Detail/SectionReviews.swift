//
//  SectionReviews.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 24/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class SectionReviews: Sections {
    
    override func header() -> CollectionViewHeader.Type? {
        CollectionViewHeader.self
    }
    
    override func willDisplayHeader(_ headerView: CollectionViewHeader) {
        headerView.configure(title: name)
    }
    
    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        ReviewCell.self
    }
    
    override func willDisplayCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {
        if let reviewCell = cell as? ReviewCell, let item = items[indexPath.row] as? ReviewItem {
            reviewCell.configure(item: item)
        }
    }
    override func getCellSize(_ cell: CollectionViewCell.Type, for indexPath: IndexPath) -> CGSize {
        .init(width: UIScreen.main.bounds.width, height: 140)
    }
    override func cellLineSpace(collectionWidth: CGFloat) -> CGFloat {
        20
    }
}
