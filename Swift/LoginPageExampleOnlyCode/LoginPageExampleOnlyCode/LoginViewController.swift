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
    var delegate: LoginSystemProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        createLogo()
        loginButton = createBtn(buttonName: "Login", rect: CGRect(x: 45, y: 650, width: 300, height: 60))
        idTextField = createTextField(leftImageName: "Id", textRect: CGRect(x: 90, y: 400, width: 230, height: 40))
        passwordTextField = createTextField(leftImageName: "Password", textRect: CGRect(x: 90, y: 500, width: 230, height: 40))
        signUpButton = createBtn(buttonName: "Sign Up", rect: CGRect(x: 160, y: 800, width: 70, height: 50))
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
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
        let signUpAlertController = UIAlertController(title: "Sign Up", message: "사용하실 아이디와 비밀번호를 입력해주세요.", preferredStyle: .alert)
        signUpAlertController.addTextField()
        signUpAlertController.addTextField()
        let okAction = UIAlertAction(title: "SignUp", style: .default){ (self) in
            guard let id = signUpAlertController.textFields?[0].text, let pw = signUpAlertController.textFields?[1].text else{return}
            UserDefaults.standard.set(id, forKey: pw)
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
        let password = UserDefaults.standard.string(forKey: idTextField.text ?? "" )
        print(password)
        switch sender {
        case loginButton where password == (passwordTextField.text ?? ""):
            let secondViewController = SecondViewController()
            delegate = secondViewController
            navigationController?.pushViewController(secondViewController, animated: true)
        case signUpButton:
            creatSignUpAlert()
        default:
            break
        }
        
       
        
    }

}

