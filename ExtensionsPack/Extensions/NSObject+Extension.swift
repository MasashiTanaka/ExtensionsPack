//
//  NSObject+Extension.swift
//  ExtensionsPack
//
//  Created by Masashi Tanaka on 2019/02/06.
//  Copyright © 2019年 Masashi Tanaka. All rights reserved.
//

import UIKit

extension NSObject {
    
    public class var className: String {
        return String(describing: self)
    }
    
    public var className: String {
        return type(of: self).className
    }
    
}
