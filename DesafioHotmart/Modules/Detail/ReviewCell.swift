//
//  ReviewCell.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 24/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit
import Cosmos
import SDWebImage

class ReviewCell: CollectionViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var cosmoView: CosmosView!
    @IBOutlet weak var boxImage: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet weak var adressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont(name: "OpenSans-Regular", size: 16)
        titleLabel.textColor = .colorTopaz
        subTitleLabel.font = UIFont(name: "OpenSans-Regular", size: 14)
        subTitleLabel.textColor = .brownishGrey
        adressLabel.font = UIFont(name: "OpenSans-Regular", size: 12)
        adressLabel.textColor = .warmGrey
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        boxImage.layer.borderColor = UIColor.brownishGrey.cgColor
        avatarImageView.backgroundColor = .white
        boxImage.layer.borderWidth = 1
        boxImage.layer.cornerRadius = avatarImageView.frame.width / 2
    }
    
    func configure(item: ReviewItem) {
        titleLabel.text = item.title
        subTitleLabel.text = item.subTitle
        adressLabel.text = item.adress
        cosmoView.rating = item.rating
        avatarImageView.sd_setImage(with: URL(string: item.avatar))
    }

}
