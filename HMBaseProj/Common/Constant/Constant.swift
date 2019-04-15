//
//  Constant.swift
//  HMProject
//
//  Created by zenganiu on 2017/8/31.
//  Copyright © 2017年 Suntrans. All rights reserved.
//

import Foundation
import UIKit
import HMKit

let kSbjColor = UIColor.red  //主题色
let kNaviBackItemImgName = "nav_back"   //navi返回按钮
let kPgyerKey = "4f5813759fc291ee4713ca6d53ab9025"  //蒲公英key

//FIXME:--尺寸相关
let kWidth = UIScreen.main.bounds.width
let kHeight = UIScreen.main.bounds.height

//是否是刘海屏
let kIsIphoneX = UIScreen.main.bounds.size == CGSize(width: 375, height: 812)
    || UIScreen.main.bounds.size == CGSize(width: 414, height: 896)

let kNavBarH: CGFloat = kIsIphoneX ? 88 : 64
let kStatusBarH: CGFloat = kIsIphoneX ? 44 : 20
let kTabBarH: CGFloat = kIsIphoneX ? 83 : 49
let kBottomH: CGFloat = kIsIphoneX ? 34 :  0













