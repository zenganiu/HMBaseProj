//
//  Function.swift
//  HMBaseProj2
//
//  Created by huimin on 2018/12/5.
//  Copyright © 2018 huimin. All rights reserved.
//

import Foundation
import UIKit


//变换根视图控制器
func kTransformRootController(rootController: UIViewController, animatable: Bool = true) {
    
    rootController.view.frame = UIScreen.main.bounds
    
    let replaceRootViewController = {
        UIApplication.shared.keyWindow?.rootViewController = rootController
    }
    
    if animatable {
        
        UIView.transition(
            with: UIApplication.shared.keyWindow ?? UIWindow(),
            duration: 0.5,
            options: UIView.AnimationOptions.transitionCrossDissolve,
            animations: {
                replaceRootViewController()
        }, completion: nil)
        
    } else {
        
        replaceRootViewController()
    }
    
}
