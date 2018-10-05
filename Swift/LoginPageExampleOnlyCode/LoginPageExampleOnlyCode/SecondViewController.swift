//
//  SecondViewController.swift
//  LoginPageExampleOnlyCode
//
//  Created by Wi on 2018. 10. 5..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var completLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        completLabel.frame = CGRect(x: 50, y: 100 , width: 200, height: 100)
        completLabel.textColor = .white
        view.addSubview(completLabel)
    }


}

extension SecondViewController: LoginSystemProtocol{
    func loginBtnDidTap(id: String) {
        completLabel.text = "\(id) 님 환영합니다"
    }
    
    
}
