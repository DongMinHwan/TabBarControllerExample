//
//  UI_Extension.swift
//  TabBarControllerExample
//
//  Created by DongMin Hwang on 2022/12/28.
//

import UIKit
import SwiftyGif


extension UIWindow {
    
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}


extension UIApplication {
    
    
}


extension UIColor {
    
    convenience init(rgb: UInt, alpha:CGFloat = 1.0) {
            self.init(
                red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgb & 0x0000FF) / 255.0,
                alpha: alpha
            )
        }
    
}
