//
//  UIApplication+KeyWindow.swift
//  NavigatorDemo
//
//  Created by KKday on 2021/10/5.
//

import UIKit

extension UIApplication {
    static var _windowKey = "_windowKey"
    func setKeyWindow(_ window : UIWindow?) {
        guard let _window = window else {return}
        objc_setAssociatedObject(self, &UIApplication._windowKey, _window, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    func _keyWindow()->UIWindow? {
        let _window = objc_getAssociatedObject(self, &UIApplication._windowKey) as? UIWindow
        return _window
    }
}
