//
//  UIColor+Extension.swift
//  ExtensionsPack
//
//  Created by Masashi Tanaka on 2019/02/06.
//  Copyright © 2019年 Masashi Tanaka. All rights reserved.
//

import UIKit

extension UIColor {
    
    public class func rgb(r: Int, g: Int, b: Int, alpha: CGFloat) -> UIColor {
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    
    public class func hex(hexString: String, alpha: CGFloat) -> UIColor {
        let string = hexString.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: string as String)
        var color: UInt32 = 0
        
        if scanner.scanHexInt32(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            
            return UIColor(red: r, green: g, blue: b, alpha: alpha)
        } else {
            return white
        }
    }
    
}
