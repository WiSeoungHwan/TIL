//
//  ViewController.swift
//  LoadingIndicatorView
//
//  Created by Wi on 23/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    
    var isTap = false
    
    lazy var button: UIButton = {
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
        btn.center = self.view.center
        btn.setTitle("로딩 테스트", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(loadingTestBtnHandler) , for: .touchUpInside)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
    }
    
    // MARK: handler
    
    @objc private func loadingTestBtnHandler(){
        isTap.toggle()
        isTap ? LoadingHUD.show() : LoadingHUD.hide()
    }


}

