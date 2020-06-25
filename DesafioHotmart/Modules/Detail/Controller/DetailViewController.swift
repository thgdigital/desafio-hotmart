//
//  DetailViewController.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 23/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit
import EmptyDataSet_Swift


class DetailViewController: CollectionViewController {
    
    var presenter: DetailPresenter!
    
    var viewModel: DetailViewModel!{
        didSet{
            collectionView.reloadEmptyDataSet()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchLocation()
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        }else {
            automaticallyAdjustsScrollViewInsets = false
        }
        collectionView.contentInset.bottom = 20
        collectionView.emptyDataSetSource = self
        collectionView.emptyDataSetDelegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "share"), style: .plain, target: nil, action: nil)
        UIApplication.shared.statusBarUIView?.backgroundColor = .clear
        
        collectionView.emptyDataSetView {[weak self] view in
            if let `self` = self {
                view.image(self.viewModel.imageEmpty)
                .imageAnimation(self.viewModel.imageAnimation)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.backgroundColor = .clear
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UIApplication.shared.statusBarUIView?.backgroundColor = .clear
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let denominator: CGFloat = 50
        let alpha = min(1, scrollView.contentOffset.y / denominator)
        self.setNavbar(backgroundColorAlpha: alpha)
    }
    
    private func setNavbar(backgroundColorAlpha alpha: CGFloat) {
        let newColor = UIColor(red: 0, green: 0, blue: 0, alpha: alpha)
        navigationController?.navigationBar.backgroundColor = newColor
        UIApplication.shared.statusBarUIView?.backgroundColor = newColor
        navigationController?.setNeedsStatusBarAppearanceUpdate()
    }
}

extension DetailViewController: DetailPresenterView {
    
    func updateCollection(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    
    func update(sections: [Sections]) {
        self.sections = sections
    }
}

extension DetailViewController: EmptyDataSetDelegate, EmptyDataSetSource {
    
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
        presenter.fetchLocation()
    }
    
    func emptyDataSetShouldAnimateImageView(_ scrollView: UIScrollView) -> Bool {
        return viewModel.isLoading
    }
    
}
