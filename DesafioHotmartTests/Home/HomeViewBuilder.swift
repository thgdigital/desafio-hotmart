//
//  HomeViewMock.swift
//  DesafioHotmartTests
//
//  Created by Thiago Vaz on 25/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit
@testable import DesafioHotmart
import CollectionViewWaterfallLayout

class HomeViewBuilder {
    static func make() -> HomeListView {
        return HomeListView(collectionViewLayout: CollectionViewWaterfallLayout())
    }
}
