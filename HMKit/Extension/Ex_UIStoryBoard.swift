//
//  UIStoryBoard+Extension.swift
//  HMBaseProj
//
//  Created by zenganiu on 2018/1/21.
//  Copyright © 2018年 Suntrans. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard{
    
    //MARK:--获取storyboard中控制器
    static func initViewController<T:AnyObject>(name: String,vc: T.Type)-> T{
        
        let vc = UIStoryboard(name: name, bundle: nil).instantiateViewController(withIdentifier: String.className(T.self))
        
        return vc as! T
        
    }
    
    static func initViewController<T:AnyObject>(name: String,vc: T.Type,identifier: String)-> T{
        
        let vc = UIStoryboard(name: name, bundle: nil).instantiateViewController(withIdentifier: identifier)
        return vc as! T
        
    }
    
}
