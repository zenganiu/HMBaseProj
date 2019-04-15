//
//  String+Extension.swift
//  HMBaseProj
//
//  Created by zenganiu on 2018/1/21.
//  Copyright © 2018年 Suntrans. All rights reserved.
//

import Foundation
import SystemConfiguration
import SystemConfiguration.CaptiveNetwork

public extension String{
    
    //MARK:-- 16进制转10进制
    static func hexToInt(num: String) -> Int {
        
        let str = num.uppercased()
        var sum = 0
        for i in str.utf8 {
            sum = sum * 16 + Int(i) - 48 // 0-9 从48开始
            if i >= 65 {                 // A-Z 从65开始
                sum -= 7
            }
        }
        return sum
    }
    
    //MARK:--根据开始位置和长度截取字符串
    func subString(start:Int, length:Int = -1)->String {
        
        var len = length
        if len == -1 {
            len = self.count - start
        }
        let st = self.index(startIndex, offsetBy:start)
        let en = self.index(st, offsetBy:len)
        let range = st ..< en
        return String(self[range])
    }
    
    //MARK:--字符串时间转date
    func dateValue(format:String = "YYYY-MM-dd HH:mm:ss") ->Date?{
        
        let formatter =  DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale.current
        let date = formatter.date(from: self)
        return date
        
    }
    
}




public extension String {
    
    
    //MARK:-- 获取当前APP版本
    static func getCurrentAppVersion()->String?{
        
        let infoDict = Bundle.main.infoDictionary
        let appVersion = infoDict?["CFBundleShortVersionString"] as? String
        return appVersion
    }
    
    //MARK:-- 获取当前语言
    static func getPreferredLanguage() -> String? {
        
        let allLanguages = UserDefaults.standard.object(forKey: "AppleLanguages") as! Array<String>
        if !allLanguages.isEmpty {
            
            let preferredLang = allLanguages[0]
            return preferredLang
            
        }else{
            return nil
        }
        
    }
    
    //MARK:-- 获取当前连接SSID
    static  func getUsedSSID() -> String {
        
        let interfaces = CNCopySupportedInterfaces()
        var ssid = ""
        if interfaces != nil {
            let interfacesArray = CFBridgingRetain(interfaces) as! Array<AnyObject>
            if interfacesArray.count > 0 {
                let interfaceName = interfacesArray[0] as! CFString
                let ussafeInterfaceData = CNCopyCurrentNetworkInfo(interfaceName)
                if (ussafeInterfaceData != nil) {
                    let interfaceData = ussafeInterfaceData as! Dictionary<String, Any>
                    ssid = interfaceData["SSID"]! as! String
                }
            }
        }
        return ssid
    }
    
    
    //MARK:-- 汉字转拼音
    func transformToPinYin() ->String {
        
        let mStr = NSMutableString(string: self)
        CFStringTransform(mStr, nil, kCFStringTransformToLatin, false)
        CFStringTransform(mStr, nil, kCFStringTransformStripDiacritics, false)
        let str = String(mStr).replacingOccurrences(of: " ", with: "")
        
        return str
        
    }
    
    //MARK:-- 获取程序名称
    static func getAppDisplayName()->String?{
        
        let infoDict = Bundle.main.infoDictionary ?? [:]
        let appDisplayName = infoDict["CFBundleDisplayName"] as? String
        return appDisplayName
        
    }
    
    
    //MARK:-- 获取根目录
    static func getHomeDir()->String{
        
        let dir = NSHomeDirectory()
        return dir
    }
    
    
    //MARK:-- 获取Documents目录
    static func getDocumentsDir()->String{
        
        let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        return dir!
    }
    
    
    //MARK:-- 获取Caches目录
    static func getCachesDir()->String{
        
        let dir = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
        return dir!
    }
    
    
    //MARK:-- 获取tmp目录
    static func getTmpDir()->String{
        
        let dir = NSTemporaryDirectory()
        return dir
    }
    
}

public extension String {
    
    //MARK:-- 获取类名
    static func className(_ aClass: AnyClass) -> String {
        
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    //MARK:--字符串长度
    var length: Int {
        return self.count
    }
    
}


public extension String{
    
    
   static func validate(pattern:String,validateString: String)->Bool{
        
        do{
            
            let regex = try NSRegularExpression(pattern: pattern,
                                                options: NSRegularExpression.Options.caseInsensitive)
            
            let matches = regex.matches(in: validateString,
                                        options: NSRegularExpression.MatchingOptions.reportProgress,
                                        range: NSMakeRange(0, validateString.count))
            
            return matches.count > 0
            
        }catch{
            
            return false
            
        }
        
    }
}
