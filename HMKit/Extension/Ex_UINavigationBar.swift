//
//  UINavigationBar+Extension.swift
//  HMBaseProj
//
//  Created by zenganiu on 2018/4/22.
//  Copyright © 2018年 Suntrans. All rights reserved.
//

import UIKit

extension UINavigationBar{
    
    func titleColor(color: UIColor){
        self.titleTextAttributes = [NSAttributedString.Key.foregroundColor:color]
    }
    
}
