//
//  UIViewController+Extension.swift
//  ExtensionsPack
//
//  Created by Masashi Tanaka on 2019/02/07.
//  Copyright © 2019年 Masashi Tanaka. All rights reserved.
//

import UIKit

public protocol StoryBoardHelper {}

extension StoryBoardHelper where Self: UIViewController {

    public static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: self.className, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: self.className) as! Self
    }
    
    public static func instantiate(storyboard: String) -> Self {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: self.className) as! Self
    }

}

extension UIViewController: StoryBoardHelper {}
