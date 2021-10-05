//
//  UINavigationController+animations.swift
//  NavigatorDemo
//
//  Created by KKday on 2021/10/5.
//

import UIKit
extension UINavigationController {
    public func togglePresentAnimation() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        transition.type = CATransitionType.moveIn
        transition.subtype = .fromTop
        transition.fillMode = .forwards
        transition.isRemovedOnCompletion = true
        self.view.layer.add(transition, forKey: nil)
    }
    public func toggleDismissAnimation() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        transition.type = CATransitionType.reveal
        transition.subtype = .fromBottom
        transition.fillMode = .forwards
        transition.isRemovedOnCompletion = true
        self.view.layer.add(transition, forKey: nil)
    }
}
