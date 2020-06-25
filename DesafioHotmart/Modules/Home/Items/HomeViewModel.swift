//
//  HomeViewModel.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 25/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

struct HomeViewModel {
    var title: String
    var message: String
    var imageEmpty: UIImage
    var isLoading: Bool
    var titleButton: String
    var imageAnimation: CAAnimation? {
        let animation = CABasicAnimation.init(keyPath: "transform")
        animation.fromValue = NSValue.init(caTransform3D: CATransform3DIdentity)
        animation.toValue = NSValue.init(caTransform3D: CATransform3DMakeRotation(.pi/2, 0.0, 0.0, 1.0))
        animation.duration = 0.25
        animation.isCumulative = true
        animation.repeatCount = MAXFLOAT
        
        return animation
    }
}

