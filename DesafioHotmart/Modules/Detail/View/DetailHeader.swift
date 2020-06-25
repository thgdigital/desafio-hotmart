//
//  DetailHeader.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 23/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit
import Cosmos
import SDWebImage

class DetailHeader: CollectionViewCell {
    @IBOutlet weak var titleHaderLabel: UILabel!
    @IBOutlet weak var rewiesCosmo: CosmosView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var boxRewies: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        titleHaderLabel.font = .headerTitleLargeLight
        boxRewies.backgroundColor = .colorTopaz
        backgroundImageView.layer.masksToBounds = true
    }
    
    func configure(item: HeaderItem) {
        titleHaderLabel.text = item.name
        rewiesCosmo.rating = item.review
        rewiesCosmo.text = "\(item.review)"
        backgroundImageView.sd_setImage(with: URL(string: item.image), completed: nil)
    }
}
