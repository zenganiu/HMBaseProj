//
//  TargetRequest.swift
//  HMBaseProj2
//
//  Created by huimin on 2018/12/21.
//  Copyright © 2018 huimin. All rights reserved.
//

import Foundation
import Alamofire

protocol TargetRequest: URLRequestConvertible{
    
    //请求路径
    var path: String { get }
    
    //参数
    var parameters:[String:Any]?{ get }
    
    //基本路径
    var baseURL: URL { get }
    
    //请求方法
    var method: HTTPMethod { get }
    
    //请求头
    var headers: [String: String]? { get }
    
    //超时时间
    var timeoutInterval:TimeInterval{ get }
    
    
    //参数编码
    func encoding(_ request: URLRequestConvertible,with parameters: Parameters?)->URLRequest
    
}



extension TargetRequest{
    
    
    func asURLRequest() throws -> URLRequest{
        
        var url = baseURL
        url.appendPathComponent(path)
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = timeoutInterval
        
        
        if let headers = self.headers{
            
            for (key,value) in headers{
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        request = encoding(request, with: parameters)
        return request
        
    }
    
    var timeoutInterval:TimeInterval{
        
        return 30
        
    }
    
    
}
