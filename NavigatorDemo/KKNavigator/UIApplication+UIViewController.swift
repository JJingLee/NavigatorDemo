//
//  UIApplication+UIViewController.swift
//  NavigatorDemo
//
//  Created by KKday on 2021/10/5.
//

import UIKit

extension UIApplication {
    func topViewController(controller: UIViewController? = UIApplication.shared._keyWindow()?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
