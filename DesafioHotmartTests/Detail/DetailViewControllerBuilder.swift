//
//  DetailViewControllerBuilder.swift
//  DesafioHotmartTests
//
//  Created by Thiago Vaz on 26/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit
@testable import DesafioHotmart

class DetailViewControllerBuilder {
    static func makeScreen() -> DetailViewController {
        return DetailViewController(collectionViewLayout: UICollectionViewFlowLayout())
    }
}
