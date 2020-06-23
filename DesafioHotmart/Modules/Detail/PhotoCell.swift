//
//  PhotoCell.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 23/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoCell: UICollectionViewCell {

    @IBOutlet weak var photoImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        photoImage.layer.cornerRadius = 5
    }
    
    func configure(urlString: String){
        photoImage.sd_setImage(with: URL(string: urlString), completed: nil)
    }

}
