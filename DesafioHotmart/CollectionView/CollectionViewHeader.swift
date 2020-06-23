//
//  CollectionViewHeader.swift
//  GloboMais
//
//  Created by THIAGO on 16/07/19.
//  Copyright © 2019 Editora Globo. All rights reserved.
//

import UIKit

class CollectionViewHeader: UICollectionReusableView {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel?.isHidden = true
    }
    
    func configure(title: String) {
        titleLabel?.isHidden = false
        titleLabel.text = title
        titleLabel.font = UIFont(name: "OpenSans-SemiBold", size: 16)
        titleLabel.textColor = .colorTopaz
    }
    
    class func fromNib() -> CollectionViewHeader? {
        return UINib(nibName: identifier, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? CollectionViewHeader
    }
}
