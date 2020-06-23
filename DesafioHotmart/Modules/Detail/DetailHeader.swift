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

class DetailHeader: CollectionViewHeader {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rewiesCosmo: CosmosView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var boxRewies: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont(name: "OpenSans-Light", size: 32)
        boxRewies.backgroundColor = .colorTopaz
        backgroundImageView.layer.masksToBounds = true
    }
    
    func configure(item: HeaderItem) {
        titleLabel.text = item.name
        rewiesCosmo.rating = item.rewies
        rewiesCosmo.text = "\(item.rewies)"
        backgroundImageView.sd_setImage(with: URL(string: item.image), completed: nil)
    }
}
