//
//  SectionDetailHeader.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 23/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class SectionDetailHeader: Sections {
    
    override func header() -> CollectionViewHeader.Type? {
        DetailHeader.self
    }
    
    override func willDisplayHeader(_ headerView: CollectionViewHeader) {
        if let itemHeader = items.first as? HeaderItem, let view = headerView as? DetailHeader {
            view.configure(item: itemHeader)
        }
    }
    override func getHeaderSize(collectionWidth: CGFloat) -> CGSize {
        .init(width: collectionWidth, height: 414)
    }
    
}
