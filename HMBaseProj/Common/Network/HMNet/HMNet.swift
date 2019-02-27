//
//  HMNet.swift
//  HMBaseProj2
//
//  Created by huimin on 2018/12/21.
//  Copyright © 2018 huimin. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

//MARK:--全局参数
extension HMNet{
    
    static var user_id = "" //用户ID
    static var token = ""   //Token
    static var phone = ""   //手机号
    
    
}

class HMNet{
    
    //响应结果
    enum ResponseResult {
        case success(Any)
        case failure(String)
    }
    
    typealias Completion = (ResponseResult)->Void
    typealias SuccessClosure = (JSON)->Void
    typealias FailureClosure = (String)->Void
    
    
    /// 模型类的路由请求
    ///
    /// - Parameters:
    ///   - target: 请求路由
    ///   - model: 数据模型
    ///   - success: 成功 数据数据
    ///   - failure: 失败 string信息
    static func request<T: TargetRequest,M: Modelable>(target: T,model: M.Type,success: @escaping ((M)->Void),failure : @escaping FailureClosure){
        
        Alamofire.request(target).responseJSON { (response) in
            
            switch response.result{
            case .success(let value):
                
                let js = JSON(value)
                let m = model.init(json:js)
                
                success(m)
                
            case .failure(let error):
                failure(error.localizedDescription)
            }
            
        }
    }
    
    
}
