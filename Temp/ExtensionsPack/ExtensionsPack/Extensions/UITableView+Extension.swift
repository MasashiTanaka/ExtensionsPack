//
//  UITableView+Extension.swift
//  ExtensionsPack
//
//  Created by Masashi Tanaka on 2019/02/06.
//  Copyright © 2019年 Masashi Tanaka. All rights reserved.
//

import UIKit

extension UITableView {
    
    public func register<T: UITableViewCell>(cellType: T.Type) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forCellReuseIdentifier: className)
    }
    
    public func register<T: UITableViewCell>(cellTypes: [T.Type]) {
        cellTypes.forEach { register(cellType: $0) }
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }
    
}
