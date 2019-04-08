//
//  UserDefaults+Extension.swift
//  HMBaseProj
//
//  Created by zenganiu on 2018/7/4.
//  Copyright © 2018年 Suntrans. All rights reserved.
//

import Foundation

extension UserDefaults{
    
    //删除UserDefaults所有记录
    class func reset(){
        guard let appDomain = Bundle.main.bundleIdentifier else { return }
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
    }
    
}
