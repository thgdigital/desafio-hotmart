//
//  LocationCell.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 19/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit
import Cosmos
import OpenSans

class LocationCell: CollectionViewCell {
    @IBOutlet weak var contraintHeigit: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var cosmosView: CosmosView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.textColor = .colorAqua
        titleLabel.font = UIFont(name: "OpenSans-SemiBold", size: 16)
        subTitleLabel.font = UIFont(name: "OpenSans-Regular", size: 12)
    }
    
    func configure(item: LocationItem) {
        contraintHeigit.constant = item.cellSizes.height - 30
        titleLabel.text = item.title
        subTitleLabel.text = item.subTitle
        containerView.backgroundColor = item.color
        cosmosView.rating = item.rewies
        cosmosView.text = "\(item.rewies)"
    }
}
