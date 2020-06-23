//
//  BoxCell.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 23/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class BoxCell: CollectionViewCell {
    var sectionIndex: Int = 0
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.scrollsToTop = false
            collectionView.dataSource = self
            collectionView.delegate = self
            
            let nibName = UINib(nibName: PhotoCell.identifier, bundle: nil)
            collectionView.register(nibName, forCellWithReuseIdentifier: PhotoCell.identifier)
        }
    }
    
    var items = [Any]() {
        didSet {
            collectionView.reloadData()
        }
    }
}

extension BoxCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as! PhotoCell
        
        if let urlString  = items[indexPath.row] as? String {
            cell.configure(urlString: urlString)
        }
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 60 , height: 60)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0, left: 24, bottom: 0, right: 24)
    }
}
