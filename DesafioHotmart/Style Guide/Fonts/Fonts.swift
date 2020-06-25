//
//  Fonts.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 19/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit
//== OpenSans-Regular
//== OpenSans-Bold
//== OpenSans-SemiBoldItalic
//== OpenSans-ExtraBoldItalic
//== OpenSans-LightItalic
//== OpenSans-BoldItalic
//== OpenSans-Light
//== OpenSans-SemiBold
//== OpenSans-Italic
//== OpenSans-ExtraBold
extension UIFont {
    class var headerTitleLargeLight: UIFont {
       return UIFont(name: "OpenSans-Light", size: 32)!
     }
    class var titleLight: UIFont {
      return UIFont(name: "OpenSans-Light", size: 16)!
    }
    class var infoTitleLight: UIFont {
      return UIFont(name: "OpenSans-Light", size: 14)!
    }
    
    class var titleRegular: UIFont {
      return UIFont(name: "OpenSans-Regular", size: 16)!
    }
    
    class var titleSemiBold: UIFont {
      return UIFont(name: "OpenSans-SemiBold", size: 16)!
    }
    
    class var subTitleRegular: UIFont {
      return UIFont(name: "OpenSans-Regular", size: 14)!
    }
    
    class var subTitleSmallRegular: UIFont {
      return UIFont(name: "OpenSans-Regular", size: 12)!
    }
}

