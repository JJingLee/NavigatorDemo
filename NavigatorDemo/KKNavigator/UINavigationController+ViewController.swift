//
//  UINavigationController+ViewController.swift
//  NavigatorDemo
//
//  Created by KKday on 2021/10/5.
//

import UIKit

extension UINavigationController {
    public func getSubViewController(with VCType:UIViewController.Type )->UIViewController? {
        self.viewControllers.first { $0.isKind(of: VCType) }
    }
}
