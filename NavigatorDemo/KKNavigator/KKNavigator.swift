//
//  KKNavigator.swift
//  NavigatorDemo
//
//  Created by KKday on 2021/10/5.
//

import UIKit

public class KKNavigator {
    static let shared : KKNavigator = KKNavigator()
    public var navigator : UINavigationController?
    public func setup(rootViewController : UIViewController) {
        navigator = UINavigationController(rootViewController: rootViewController)
        UIApplication.shared._keyWindow()?.rootViewController = navigator
        UIApplication.shared._keyWindow()?.makeKeyAndVisible()
    }
    public func push(_ viewController : UIViewController, _ animation : Bool = true) {
        UIApplication.shared.topViewController()?.navigationController?.pushViewController(viewController, animated: animation)
    }
    public func pop(to viewContollerType : UIViewController.Type? = nil, _ animation : Bool = true) {
        guard let vcT = viewContollerType else {
            navigator?.popViewController(animated: animation)
            return
        }
        guard let targetVC = navigator?.getSubViewController(with: vcT) else {return}
        navigator?.popToViewController(targetVC, animated: animation)
    }
    
    public func present(_ viewController : UIViewController) {
        navigator?.togglePresentAnimation()
        self.push(viewController, false)
    }
    public func dismiss(to viewController : UIViewController.Type? = nil) {
        navigator?.toggleDismissAnimation()
        self.pop(to: viewController, false)
    }
    
}
