//
//  PinterestLayout.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 19/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit


protocol PinterestLayoutDelegate: class {
    
}

class PinterestLayout: UICollectionViewFlowLayout {
    weak var delegate:PinterestLayoutDelegate?
    var numberOfCollumns: Int = 0
    var cellPadding: CGFloat  = 30
    
    fileprivate var cache: [UICollectionViewLayoutAttributes] = []
    
    var conteHeight: CGFloat = 0
    
    fileprivate var contentWidth: CGFloat {
        guard let collectionView = self.collectionView else {
            return 0
        }
        let  insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left - insets.right)
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: conteHeight)
    }
    
    override func prepare() {
        guard cache.isEmpty, let collectionView = collectionView else {
            return
        }
        
        let columWidth = contentWidth / CGFloat(numberOfCollumns)
        var xOffset = [CGFloat]()
        for colum in 0 ..< numberOfCollumns {
            xOffset.append(CGFloat(colum) * columWidth)
        }
    }
}
