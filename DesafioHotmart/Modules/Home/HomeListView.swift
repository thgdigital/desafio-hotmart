//
//  HomeListView.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 18/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit
import CollectionViewWaterfallLayout

class HomeListView: UICollectionViewController {
    var presenter: HomePresenter!
    
    var items: [LocationItem] = [LocationItem](){
        didSet {
           collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        title = "Home"
        
        let nibName = UINib(nibName: "LocationCell", bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: LocationCell.identifier)
        
        let layout = CollectionViewWaterfallLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.headerInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        layout.headerHeight = .zero
        layout.footerHeight = .zero
        layout.minimumColumnSpacing = 10
        layout.minimumInteritemSpacing = 10
        collectionView.collectionViewLayout = layout
        
        presenter.viewDidLoad()

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
}
// MARK: - UICollectionViewDataSource
extension HomeListView {
  
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LocationCell.identifier, for: indexPath) as! LocationCell
        cell.backgroundColor = .white
        cell.configure(item: items[indexPath.row])
        cell.shadowDecorate()
        
        return cell
    }
    
}

extension HomeListView: HomePresenterView {
    
    func update(items: [LocationItem]) {
        self.items = items
    }
    
    func setupNavigationBar(){
        navigationController?.navigationBar.barTintColor = .colorTopaz
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false
    }
}

// MARK: - CollectionViewWaterfallLayoutDelegate
extension HomeListView: CollectionViewWaterfallLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return items[indexPath.item].cellSizes
    }
}

import SwiftUI
@available(iOS 13.0, *)
struct MainPreview: PreviewProvider {
    typealias UIViewControllerType = UIViewController
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            HomeListView(collectionViewLayout: UICollectionViewFlowLayout())
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            
        }
    }
}

