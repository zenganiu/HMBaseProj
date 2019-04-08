//
//  Ex_UIButton.swift
//  YLCloud
//
//  Created by huimin on 2018/11/28.
//  Copyright © 2018 huimin. All rights reserved.
//

import Foundation
import UIKit


extension UIButton{
    
    func startSMSWithDuration(duration:Int){
        
        var times = duration
        let normalBGColor = self.backgroundColor
        
        let timer:DispatchSourceTimer = DispatchSource.makeTimerSource(flags: [], queue:DispatchQueue.global())
        
        timer.setEventHandler {
            if times > 0{
                DispatchQueue.main.async(execute: {
                    self.isEnabled = false
                    self.setTitle("\(times)s", for: .disabled)
                    self.setTitleColor(UIColor.white, for: .disabled)
                    self.backgroundColor = UIColor.red
                    times -= 1
                })
            } else{
                DispatchQueue.main.async(execute: {
                    self.isEnabled = true
                    self.backgroundColor = normalBGColor
                    timer.cancel()
                })
            }
        }
        
        // timer.scheduleOneshot(deadline: .now())
        timer.schedule(deadline: .now(), repeating: .seconds(1), leeway: .milliseconds(100))
        
        timer.resume()
        
        // 在调用DispatchSourceTimer时, 无论设置timer.scheduleOneshot, 还是timer.scheduleRepeating代码 不调用cancel(), 系统会自动调用
        // 另外需要设置全局变量引用, 否则不会调用事件
    }
}
