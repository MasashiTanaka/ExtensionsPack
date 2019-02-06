//
//  UIView+Extension.swift
//  ExtensionsPack
//
//  Created by Masashi Tanaka on 2019/02/06.
//  Copyright © 2019年 Masashi Tanaka. All rights reserved.
//

import UIKit

public protocol NibInstantiatable {}
extension UIView: NibInstantiatable {}

extension NibInstantiatable where Self: UIView {
    
    public static func instantiate(withOwner ownerOrNil: Any? = nil) -> Self {
        let nib = UINib(nibName: self.className, bundle: nil)
        
        return nib.instantiate(withOwner: ownerOrNil, options: nil)[0] as! Self
    }
    
}

extension UIView {
    
    public func loadNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.className, bundle: bundle)
        
        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            addSubview(view)
            
            view.translatesAutoresizingMaskIntoConstraints = false
            let bindings = ["view": view]
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",
                                                          options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                          metrics: nil,
                                                          views: bindings))
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",
                                                          options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                          metrics: nil,
                                                          views: bindings))
        }
    }

}
