//
//  ViewController.swift
//  NavigatorDemo
//
//  Created by KKday on 2021/10/5.
//

import UIKit

class ViewController: UIViewController {
    let btn : UIButton = {
        let _btn = UIButton()
        _btn.setTitle("goToVC2", for: .normal)
        _btn.setTitleColor(.black, for: .normal)
        return _btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        self.view.addSubview(btn)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        btn.addTarget(self, action: #selector(self.gotoVC2), for: .touchUpInside)
        
    }

    @objc func gotoVC2() {
        KKNavigator.shared.push(ViewController2())
    }
}
