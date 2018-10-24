//
//  LoginViewController.swift
//  InstagramLoginPageExample
//
//  Created by Wi on 17/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.addSubview(loginView)
        loginView.delegate = self
        
        autoLayOut()
    }
    
    
    func autoLayOut() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        loginView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        loginView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
        loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    }
    func creatSignUpAlert(){
        let signUpAlertController = UIAlertController(title: "Sign Up", message: "사용하실 아이디와 비밀번호를 입력해주세요. \n (4자 이상)", preferredStyle: .alert)
        signUpAlertController.addTextField()
        signUpAlertController.addTextField()
        let okAction = UIAlertAction(title: "SignUp", style: .default){ _ in
            guard let id = signUpAlertController.textFields?[0].text,
                  let pw = signUpAlertController.textFields?[1].text else {return}
            print(id)
            print(pw)
            if id.count < 4 , pw.count < 4 {
                let signUpFailAlert = UIAlertController(title: "Sign Up Fail", message: "아이디와 비밀번호를 4자 이상 입력해주세요 ", preferredStyle: .alert)
                let signUpOkAction = UIAlertAction(title: "OK", style: .default, handler: { (self) in
                    return
                })
                signUpFailAlert.addAction(signUpOkAction)
                self.present(signUpFailAlert, animated: true, completion: nil)
            }else {
                UserInfo.singleton.signUp(id: id, password: pw)
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
}

extension LoginViewController: LoginViewDelegate{
    func loginButtonDidTab(id: String?, pw: String?) {
        print("login Tap")
        if UserInfo.singleton.login(id: id ?? "", password: pw ?? ""){
            present(MyFeedViewController(), animated: true)
        }else{
            print("실패")
        }
    }
    
    func signUpButtonDidTab() {
        creatSignUpAlert()
    }
    
    
}
