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
    private let forgetPWButton = UIButton()
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
        idTextField.backgroundColor = UIColor.lightGray
        idTextField.placeholder = "아이디"
        idTextField.textAlignment = .left
        
        pwTextField.borderStyle = .bezel
        pwTextField.backgroundColor = UIColor.lightGray
        pwTextField.placeholder = "비밀번호"
        pwTextField.textAlignment = .right
        
        //button
        forgetPWButton.backgroundColor = .white
        forgetPWButton.titleLabel?.textColor = .blue
        forgetPWButton.setTitle("비밀번호를 잊으셨나요?", for: .normal)
        forgetPWButton.titleLabel?.textAlignment = .right
        
        loginButton.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 1, alpha: 0.5)
        loginButton.titleLabel?.textColor = .white
        loginButton.setTitle("로그인", for: .normal)
        loginButton.titleLabel?.textAlignment = .center
        
        
        //autoLayout
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        forgetPWButton.translatesAutoresizingMaskIntoConstraints = false

        
        
        
        //addSubView
        self.addSubview(logoImageView)
        self.addSubview(idTextField)
        self.addSubview(pwTextField)
        self.addSubview(loginButton)
        self.addSubview(forgetPWButton)


    }
    func autoLayOut(){
        logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 150).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50).isActive = true
        
        idTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 30).isActive = true
        idTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        idTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10).isActive = true
//        idTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
//        idTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        idTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true

//        pwTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 10).isActive = true
//        pwTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin).isActive = true
//        pwTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin).isActive = true
//        pwTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        idTextField.widthAnchor.constraint(equalToConstant: self.frame.width - 20)
//        pwTextField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -30).isActive = true
//
////        forgetPWButton.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 15).isActive = true
////        forgetPWButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin).isActive = true
//////        forgetPWButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 400).isActive = true
////        forgetPWButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -20).isActive = true
//
//        loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin).isActive = true
//        loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -margin).isActive = true
//        loginButton.topAnchor.constraint(equalTo: forgetPWButton.bottomAnchor, constant: 20).isActive = true
//        loginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -margin).isActive = true
        
        
        
        
    }
    
    

}
