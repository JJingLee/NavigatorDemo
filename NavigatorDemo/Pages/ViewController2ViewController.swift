//
//  ViewController2ViewController.swift
//  NavigatorDemo
//
//  Created by KKday on 2021/10/5.
//

import UIKit

class ViewController2: UIViewController {
    let btn : UIButton = {
        let _btn = UIButton()
        _btn.setTitle("pushtoVC2", for: .normal)
        _btn.setTitleColor(.black, for: .normal)
        return _btn
    }()
    let btn2 : UIButton = {
        let _btn = UIButton()
        _btn.setTitle("popToVC", for: .normal)
        _btn.setTitleColor(.black, for: .normal)
        return _btn
    }()
    let btn3 : UIButton = {
        let _btn = UIButton()
        _btn.setTitle("presentVC2", for: .normal)
        _btn.setTitleColor(.black, for: .normal)
        return _btn
    }()
    let btn4 : UIButton = {
        let _btn = UIButton()
        _btn.setTitle("dismissVC", for: .normal)
        _btn.setTitleColor(.black, for: .normal)
        return _btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .lightGray
        self.view.addSubview(btn)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        btn.addTarget(self, action: #selector(self.pushtoVC2), for: .touchUpInside)
        self.view.addSubview(btn2)
        btn2.frame = CGRect(x: 100, y: 180, width: 100, height: 50)
        btn2.addTarget(self, action: #selector(self.popToVC), for: .touchUpInside)
        self.view.addSubview(btn3)
        btn3.frame = CGRect(x: 100, y: 260, width: 100, height: 50)
        btn3.addTarget(self, action: #selector(self.presentVC2), for: .touchUpInside)
        self.view.addSubview(btn4)
        btn4.frame = CGRect(x: 100, y: 340, width: 100, height: 50)
        btn4.addTarget(self, action: #selector(self.dismissVC), for: .touchUpInside)
    }
    
    @objc func pushtoVC2() {
        KKNavigator.shared.push(ViewController2())
    }
    
    @objc func popToVC() {
        KKNavigator.shared.pop(to: ViewController.self)
    }
    @objc func presentVC2() {
        KKNavigator.shared.present(ViewController2())
    }
    
    @objc func dismissVC() {
        KKNavigator.shared.dismiss(to: ViewController.self)
    }

}
