//
//  Api.swift
//  HMBaseProj2
//
//  Created by huimin on 2018/12/21.
//  Copyright © 2018 huimin. All rights reserved.
//

import Foundation
import Alamofire

enum Api{
    
    case login(user: String,pwd: String)

}


extension Api: TargetRequest{
    
    //FIXME:--主机
    var baseURL: URL{
        
        switch self {
            //        case .xd_problemHandle,.xd_UndonePlan,.xd_planExcuter,.xd_planStore,
            //             .xd_planResult,.xd_addPatrolPlan,.userLogin:
        //            return URL(string: "http://10.172.20.206:9002/")!
        default:
            return URL(string: "http://app.yaliangyun.com:9002/")!
            //return URL(string: "http://10.172.20.206:9002/")!
        }
        
    }
    
    //FIXME:--路径
    var path: String{
        
        switch self {
            case .login:
                return "user/login"
        }
    }
    
    //FIXME:--请求参数
    var parameters:[String:Any]?{
        
        var param: [String: Any] = [:]
        
        switch self {
        case .login(user: let user, pwd: let pwd):
            param["custCode"] = user
            param["mobile"] = pwd
        }
        return param
    }
    
    
    //FIXME:--请求头
    var headers: [String : String]?{
        
        switch self  {
        case .login:
            return nil
//        default:
//            return ["CSRF_TOKEN":HMNet.token]
        }
        
    }
    
    var timeoutInterval:TimeInterval{
        return 20
    }
    
    
    //FIXME:--请求返回
    var method: HTTPMethod {
        
        switch self {
        case .login:
            return .post
//        default:
//            return .get
        }
    }
    
    
    //FIXME:--编码方式
    func encoding(_ request: URLRequestConvertible, with parameters: Parameters?)->URLRequest{
        
        switch self {
        case .login:
            return try! JSONEncoding.default.encode(request, with: parameters)
//        default:
//            return try! URLEncoding.default.encode(request, with: parameters)
        }
    }
    
}
