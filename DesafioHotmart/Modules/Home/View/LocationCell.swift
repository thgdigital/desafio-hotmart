//
//  LocationCell.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 19/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit
import Cosmos
import SDWebImage

class LocationCell: CollectionViewCell {
    @IBOutlet weak var contraintHeigit: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var cosmosView: CosmosView!
    @IBOutlet weak var locationImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.textColor = .colorAqua
        titleLabel.font = .titleSemiBold
        subTitleLabel.font = .subTitleSmallRegular
    }
    
    func configure(item: LocationItem) {
        contraintHeigit.constant = item.cellSizes.height - 30
        titleLabel.text = item.title
        subTitleLabel.text = item.subTitle
        containerView.backgroundColor = item.color
        cosmosView.rating = item.rewies
        cosmosView.text = "\(item.rewies)"
        locationImageView.sd_setImage(with: URL(string: item.image)) { (image, error, cache, url) in
            if error != nil {
                self.containerView.backgroundColor = .clear
            }
        }
    }
}
