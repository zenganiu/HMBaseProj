//
//  Data+Extension.swift
//  HMBaseProj
//
//  Created by zenganiu on 2018/1/21.
//  Copyright © 2018年 Suntrans. All rights reserved.
//

import Foundation

public extension Data {
    
    //MARK:-- 根据开始位置和长度截取数据
    func subData(start: Int, length: Int)->Data{
        
        let startIndex = self.startIndex.advanced(by: start)
        let endIndex   = self.startIndex.advanced(by: start+length)
        return self.subdata(in: Range(uncheckedBounds: (startIndex,endIndex)))
    }
    
    //MARK:-- 二进制流转十进制
    func intValue() ->Int{
        
        var value: Int = 0
        for (index,byte) in self.enumerated(){
            value += Int(byte) * Int(pow(256, Double(index)))
        }
        return value
        
    }
    
    
    ///  data 转换成浮点数
    ///
    /// - Returns: Float
    func floatValue()->Float{
        
        var value: Int = 0
        for (index,byte) in self.enumerated(){
            value += Int(byte) * Int(pow(256, Double(index)))
        }
        return Float(value)
    }
    
    
}
