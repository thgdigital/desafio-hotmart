//
//  InfoCell.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 23/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class InfoCell: CollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.font = UIFont(name: "OpenSans-Light", size: 14)
        titleLabel.textColor = .darkGraphite
    }
    
    func configure(item: InfoItem) {
        titleLabel.text = item.text
        iconImageView.image = UIImage(named: item.image)
    }

}
