//
//  HomeListView.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 18/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit
import CollectionViewWaterfallLayout
import EmptyDataSet_Swift

class HomeListView: UICollectionViewController {
    var presenter: HomePresenter!
    var viewModel: HomeViewModel!{
        didSet{
            collectionView.reloadEmptyDataSet()
        }
    }
    
    var items: [LocationItem] = [LocationItem](){
        didSet {
           collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        navigationItem.title = "Home"
        
        let nibName = UINib(nibName: "LocationCell", bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: LocationCell.identifier)
        collectionView.emptyDataSetSource = self
        collectionView.emptyDataSetDelegate = self
        let layout = CollectionViewWaterfallLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.headerInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        layout.headerHeight = .zero
        layout.footerHeight = .zero
        layout.minimumColumnSpacing = 10
        layout.minimumInteritemSpacing = 10
        collectionView.collectionViewLayout = layout
        
        presenter.viewDidLoad()
        
        collectionView.emptyDataSetView {[weak self] view in
            if let `self` = self {
                view.image(self.viewModel.imageEmpty)
                .imageAnimation(self.viewModel.imageAnimation)
            }
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.updateView()
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelected(id: items[indexPath.row].id)
    }
    
}

extension HomeListView: HomePresenterView {
    
    func updateCollection(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
            
    func update(items: [LocationItem]) {
        self.items = items
    }
    
    func setupNavigationBar(){
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = .colorTopaz
        self.navigationController?.navigationBar.backgroundColor = .colorTopaz
        self.navigationController?.navigationBar.tintColor = .white
        UIApplication.shared.statusBarUIView?.backgroundColor = .colorTopaz
        self.navigationController?.setNeedsStatusBarAppearanceUpdate()
    }
}

// MARK: - CollectionViewWaterfallLayoutDelegate
extension HomeListView: CollectionViewWaterfallLayoutDelegate, EmptyDataSetDelegate, EmptyDataSetSource {
    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return items[indexPath.item].cellSizes
    }
    
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let attrs = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline)]
        return NSAttributedString(string: viewModel.title, attributes: attrs)
    }
    func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let attrs = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .body)]
        return NSAttributedString(string: viewModel.message, attributes: attrs)
    }

    func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? {
        return viewModel.imageEmpty
    }

    func buttonTitle(forEmptyDataSet scrollView: UIScrollView, for state: UIControl.State) -> NSAttributedString? {
        let attrs = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .callout)]
        return NSAttributedString(string: viewModel.titleButton, attributes:attrs)
    }

    
    func emptyDataSet(_ scrollView: UIScrollView, didTapView view: UIView) {
        presenter.fetch()
    }
    
    func emptyDataSetShouldAnimateImageView(_ scrollView: UIScrollView) -> Bool {
        return viewModel.isLoading
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
            UINavigationController(rootViewController: HomeRoute().makeScreen())
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            
        }
    }
}

