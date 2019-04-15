//
//  UITextField+Extension.swift
//  HMBaseProj
//
//  Created by zenganiu on 2018/1/21.
//  Copyright © 2018年 Suntrans. All rights reserved.
//

import Foundation
import UIKit

public extension UITextField{
    
    /**限制长度 */
    func limitLength(length:Int){
        
        self.tag = length
        self.addTarget(self, action: #selector(tfDidChange), for: .editingChanged)
        
    }
    @objc func tfDidChange(textField:UITextField){
        
        guard let tf = textField.text else { return }
        if tf.count > textField.tag{
            
            textField.text = textField.text?.subString(start: 0, length: textField.tag)
        } 
    }

}






