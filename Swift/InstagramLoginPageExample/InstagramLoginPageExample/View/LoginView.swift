//
//  LoginView.swift
//  InstagramLoginPageExample
//
//  Created by Wi on 17/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class LoginView: UIView {
    private let instagramLogoStr = "instagramLogo"
    private let logoImageView = UIImageView()
    private let idTextField = UITextField()
    private let pwTextField = UITextField()
    private let loginButton = UIButton()
    private let signUpButton = UIButton()
    let margin: CGFloat = 10
    override init(frame: CGRect) {// Use Code
        super.init(frame: frame)
        configure()
        autoLayOut()
    }
    required init?(coder aDecoder: NSCoder) {// Use Storyboard
        super.init(coder: aDecoder)
        configure()
        autoLayOut()
    }
    
    func configure(){
        //logo
        logoImageView.image = UIImage(named: instagramLogoStr)
        logoImageView.contentMode = .center
        
        //textfield
        idTextField.borderStyle = .bezel
        idTextField.backgroundColor = UIColor.white
        idTextField.placeholder = "아이디"
        idTextField.textAlignment = .left
        idTextField.borderStyle = .roundedRect
        
        pwTextField.borderStyle = .bezel
        pwTextField.backgroundColor = UIColor.white
        pwTextField.placeholder = "비밀번호"
        pwTextField.textAlignment = .left
        pwTextField.borderStyle = .roundedRect
        pwTextField.isSecureTextEntry = true
        
        //button
        signUpButton.backgroundColor = .white
        signUpButton.setTitle("아이디가 없나요?", for: .normal)
        signUpButton.titleLabel?.textAlignment = .right
        signUpButton.setTitleColor(.blue, for: .normal)
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        signUpButton.addTarget(self, action: #selector(buttonDidtap), for: .touchUpInside)
        
        loginButton.backgroundColor = .blue
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setTitle("로그인", for: .normal)
        loginButton.titleLabel?.textAlignment = .center
        loginButton.layer.cornerRadius = 5
        loginButton.addTarget(self, action: #selector(buttonDidtap), for: .touchUpInside)

        
        //autoLayout
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        //addSubView
        self.addSubview(logoImageView)
        self.addSubview(idTextField)
        self.addSubview(pwTextField)
        self.addSubview(signUpButton)
        self.addSubview(loginButton)
        
    }
    func autoLayOut(){
        logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 150).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50).isActive = true
        
        idTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 30).isActive = true
        idTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin).isActive = true
        idTextField.widthAnchor.constraint(equalToConstant: 350).isActive = true
        idTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true

        pwTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 10).isActive = true
        pwTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin).isActive = true
        pwTextField.widthAnchor.constraint(equalToConstant: 350).isActive = true
        pwTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        signUpButton.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 10).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true

        loginButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 30).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 350).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 1).isActive = true
//        loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    }
    
    @objc func buttonDidtap(_ sender: UIButton){
        switch sender {
        case loginButton:
            break
        case signUpButton:
            
            break
        default:
            break
        }
    }
    

}
