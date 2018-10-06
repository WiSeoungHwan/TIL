//
//  SecondViewController.swift
//  LoginPageExampleOnlyCode
//
//  Created by Wi on 2018. 10. 5..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var logoutButton = UIButton()
    var completLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        completLabel.frame = CGRect(x: 100, y: 100 , width: 350, height: 100)
        navigationController?.hidesBarsOnTap = true
        completLabel.font = UIFont.systemFont(ofSize: 30)
        completLabel.textColor = .white
        logoutButton.frame = CGRect(x: 45, y: 650, width: 300, height: 60)
        logoutButton.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.addTarget(self, action: #selector(btnDidTap), for: .touchUpInside)
        
        view.addSubview(logoutButton)
        view.addSubview(completLabel)
    }
    @objc func btnDidTap(_ sender: UIButton){
        UserDefaults.standard.setValue(false, forKey: "RememberMe")
        navigationController?.popViewController(animated: true)
    }

}

extension SecondViewController: LoginSystemProtocol{
    func loginBtnDidTap(id: String) {
        completLabel.text = "\(id) 님 환영합니다"
    }
    
    
}
