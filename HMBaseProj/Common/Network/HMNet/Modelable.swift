//
//  Modelable.swift
//  HMBaseProj2
//
//  Created by huimin on 2018/12/21.
//  Copyright © 2018 huimin. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol Modelable {
    var code: Int {get set}
    var msg: String? {get set}
    init(json: JSON)
}
