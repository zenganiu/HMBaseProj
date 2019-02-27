//
//  UIView+Extension.swift
//  HMBaseProj
//
//  Created by zenganiu on 2018/1/21.
//  Copyright © 2018年 Suntrans. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    //MARK:-- 从nib加载视图
    class func loadNib() -> Self {
        return loadNib(self)
    }
    
    class func loadNib<T: UIView>(_ viewType: T.Type) -> T {
        let className = String.className(viewType)
        return Bundle(for: viewType).loadNibNamed(className, owner: nil, options: nil)!.first as! T
    }
    
    
    //获取某个view所在的控制器
    func viewController()->UIViewController?{
        
        var viewController: UIViewController? = nil
        var next = self.next
        while (next != nil) {
            
            if let vc = next as? UIViewController{
                viewController = vc
                break
            }
            next = next?.next
        }
        return viewController
        
    }
    
    //查找指定的控制器
    func findController<T: UIViewController>(controller: T.Type)->T?{
        
        var viewController: T? = nil
        var next = self.next
        while (next != nil) {
            
            if let vc = next as? T{
                viewController = vc
                break
            }
            next = next?.next
        }
        return viewController
    }
    
}
