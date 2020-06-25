//
//  SectionDetailHeader.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 23/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class SectionDetailHeader: Sections {
    

    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        DetailHeader.self

    }
   
    override func getCellSize(_ cell: CollectionViewCell.Type, for indexPath: IndexPath) -> CGSize {
        .init(width: UIScreen.main.bounds.width, height: 430)
    }
    
    override func willDisplayCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {
        if let header = cell as? DetailHeader, let headerItem = items[indexPath.row] as? HeaderItem {
            header.configure(item: headerItem)
        }
    }
}
