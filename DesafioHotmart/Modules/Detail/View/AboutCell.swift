//
//  AboutCell.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 23/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class AboutCell: CollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
         titleLabel.font = UIFont(name: "OpenSans-Light", size: 16)
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
}
