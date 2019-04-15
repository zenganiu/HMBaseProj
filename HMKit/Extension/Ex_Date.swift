//
//  Date+Extension.swift
//  HMBaseProj
//
//  Created by zenganiu on 2018/6/27.
//  Copyright © 2018年 Suntrans. All rights reserved.
//

import Foundation

public extension Date{
    
    func stringValue(format:String = "YYYY-MM-dd HH:mm:ss") -> String {
        let formatter =  DateFormatter()
        formatter.dateFormat = format
        let timeStr = formatter.string(from: self)
        return timeStr
    }
    
    
    
}
