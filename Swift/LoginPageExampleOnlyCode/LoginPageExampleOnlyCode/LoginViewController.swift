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
    var signUpButton = UIButton()
    var rememberMeSwitch = UISwitch()
    var rememberMeLabel = UILabel()
    var isOnRememberSwitch = false
    var delegate: LoginSystemProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        isOnRememberSwitch = UserDefaults.standard.value(forKey: "RememberMe") != nil
        if isOnRememberSwitch {
            navigationController?.pushViewController(SecondViewController(), animated: true)
        }
        createLogo()
        loginButton = createBtn(buttonName: "Login", rect: CGRect(x: 45, y: 650, width: 300, height: 60))
        idTextField = createTextField(leftImageName: "Id", textRect: CGRect(x: 90, y: 400, width: 230, height: 40))
        passwordTextField = createTextField(leftImageName: "Password", textRect: CGRect(x: 90, y: 500, width: 230, height: 40))
        signUpButton = createBtn(buttonName: "Sign Up", rect: CGRect(x: 160, y: 800, width: 70, height: 50))
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        rememberMeSwitch.isOn = false
        rememberMeSwitch.frame = CGRect(x: 230, y: 600, width: 50, height: 40)
        rememberMeLabel.frame = CGRect(x: 100, y: 600, width: 150, height: 40)
        rememberMeLabel.text = "RememberMe"
        rememberMeLabel.font = UIFont.systemFont(ofSize: 20)
        rememberMeLabel.textColor = .white
        view.addSubview(rememberMeLabel)
        view.addSubview(rememberMeSwitch)
        
    }
    
    
    func createLogo(){
        let logoImageView = UIImageView(frame: CGRect(x: 20, y: 100, width: 400, height: 200))
        logoImageView.image = UIImage(named: "logo")
        view.addSubview(logoImageView)
    }
    func createBtn(buttonName name: String, rect: CGRect) -> UIButton {
        let btn = UIButton(frame: rect)
        btn.setTitle(name, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        btn.titleLabel?.shadowColor = .red
        btn.titleLabel?.textAlignment = .center
        btn.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
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

    func creatSignUpAlert(){
        let signUpAlertController = UIAlertController(title: "Sign Up", message: "사용하실 아이디와 비밀번호를 입력해주세요. \n (4자 이상)", preferredStyle: .alert)
        signUpAlertController.addTextField()
        signUpAlertController.addTextField()
        let okAction = UIAlertAction(title: "SignUp", style: .default){ _ in
            guard let id = signUpAlertController.textFields?[0].text, let pw = signUpAlertController.textFields?[1].text else{return}
            print(id)
            print(pw)
            if id.count < 5 , pw.count < 5 {
                let signUpFailAlert = UIAlertController(title: "Sign Up Fail", message: "아이디와 비밀번호를 4자 이상 입력해주세요 ", preferredStyle: .alert)
                let signUpOkAction = UIAlertAction(title: "OK", style: .default, handler: { (self) in
                    return
                })
                signUpFailAlert.addAction(signUpOkAction)
                self.present(signUpFailAlert, animated: true, completion: nil)
            }else {
                UserDefaults.standard.set(pw, forKey: id)
            }
            
        
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        signUpAlertController.textFields?[0].leftView = UIImageView(image: UIImage(named: "Id"))
        signUpAlertController.textFields?[0].leftViewMode = .always
        signUpAlertController.textFields?[1].leftView = UIImageView(image: UIImage(named: "Password"))
        signUpAlertController.textFields?[1].leftViewMode = .always

        signUpAlertController.addAction(okAction)
        signUpAlertController.addAction(cancelAction)
        present(signUpAlertController, animated: true)
    }
    
    @objc private func buttonDidTap(_ sender: UIButton) {
        
        switch sender {
        case loginButton:
            let password = UserDefaults.standard.string(forKey: idTextField.text ?? "" )
            if password == passwordTextField.text {
                let secondViewController = SecondViewController()
                delegate = secondViewController
                delegate?.loginBtnDidTap(id: idTextField.text ?? "")
                UserDefaults.standard.setValue(rememberMeSwitch.isOn, forKey: "RememberMe")
                navigationController?.pushViewController(secondViewController, animated: true)
            }else{
                let loginfailAlert = UIAlertController(title: "Login Fail", message: "회원가입 또는 아이디와 비밀번호를 확인해주세요.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default)
                loginfailAlert.addAction(okAction)
                present(loginfailAlert,animated: true)
                
            }
            
        case signUpButton:
            creatSignUpAlert()
        default:
            break
        }
        
       
        
    }

}

 
