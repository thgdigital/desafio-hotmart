//
//  SectionInfo.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 23/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class SectionInfo: Sections {
 
    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        InfoCell.self
    }
    
    override func willDisplayCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {
        if let infoCell = cell as? InfoCell, let item = items[indexPath.row] as? InfoItem {
            infoCell.configure(item: item)
        }
    }
}
