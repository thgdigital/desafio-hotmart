//
//  DetailViewController.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 23/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class DetailViewController: CollectionViewController {
    var presenter: DetailPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchLocation()
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        }else {
            automaticallyAdjustsScrollViewInsets = false
        }
        collectionView.contentInset.bottom = 20
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "share"), style: .plain, target: nil, action: nil)
        UIApplication.shared.statusBarUIView?.backgroundColor = .clear
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
    
    func update(sections: [Sections]) {
        self.sections = sections
    }
}
