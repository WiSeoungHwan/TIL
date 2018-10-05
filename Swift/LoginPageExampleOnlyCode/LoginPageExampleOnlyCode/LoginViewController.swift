//
//  LoginViewController.swift
//  LoginPageExampleOnlyCode
//
//  Created by Wi on 2018. 10. 5..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var idTextField = UITextField()
    var passwordTextField = UITextField()
    var loginButton = UIButton()
    var delegate: LoginSystemProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        createLogo()
        loginButton = createLoginBtn(buttonName: "Login", rect: CGRect(x: 45, y: 650, width: 300, height: 60))
        idTextField = createTextField(leftImageName: "Id", textRect: CGRect(x: 90, y: 400, width: 230, height: 40))
        passwordTextField = createTextField(leftImageName: "Password", textRect: CGRect(x: 90, y: 500, width: 230, height: 40))
        
    }
    
    
    func createLogo(){
        let logoImageView = UIImageView(frame: CGRect(x: 20, y: 100, width: 400, height: 200))
        logoImageView.image = UIImage(named: "logo")
        view.addSubview(logoImageView)
    }
    func createLoginBtn(buttonName name: String, rect: CGRect) -> UIButton {
        let btn = UIButton(frame: rect)
        btn.setTitle(name, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        btn.titleLabel?.shadowColor = .red
        btn.titleLabel?.textAlignment = .center
        btn.addTarget(self, action: #selector(login), for: .touchUpInside)
        view.addSubview(btn)
        return btn
    }
    func createTextField(leftImageName image: String, textRect rect: CGRect) -> UserTextField{
        let textField = UserTextField(frame: rect)
        textField.leftView = UIImageView(image: UIImage(named: image))
        textField.leftViewMode = .always
        textField.placeholder = image
        textField.textColor = .white
        textField.backgroundColor = .black
        view.addSubview(textField)
        return textField
    }
    
    @objc private func login() {
        
        let secondViewController = SecondViewController()
        delegate = secondViewController
        
        navigationController?.pushViewController(secondViewController, animated: true)
        
        delegate?.loginBtnDidTap(id: idTextField.text ?? "실패")
    }

}

