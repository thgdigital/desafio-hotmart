//
//  SectionAbout.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 23/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class SectionAbout: Sections {
    
    override func header() -> CollectionViewHeader.Type? {
        CollectionViewHeader.self
    }
    
    override func willDisplayHeader(_ headerView: CollectionViewHeader) {
        headerView.configure(title: name)
    }
    
    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        AboutCell.self
    }
    
    override func willDisplayCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {
        if let aboutCell = cell as? AboutCell, let text = items[indexPath.row] as? String {
            aboutCell.configure(title: text)
        }
    }
    
    override func cellWidth(collectionWidth: CGFloat) -> CGFloat {
        return collectionWidth - 48
    }
    
}
