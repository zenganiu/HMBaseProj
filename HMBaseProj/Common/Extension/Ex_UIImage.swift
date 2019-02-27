//
//  UIImage+Extension.swift
//  HMBaseProj
//
//  Created by zenganiu on 2018/1/21.
//  Copyright © 2018年 Suntrans. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    //MARK:--改变前景色
    func tintColor(color: UIColor) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(size, false,0.0)
        color.setFill()
        let bounds = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIRectFill(bounds)
        self.draw(in: bounds, blendMode: .destinationIn, alpha: 1.0)
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return tintedImage!
        
    }
    
    
    
}
