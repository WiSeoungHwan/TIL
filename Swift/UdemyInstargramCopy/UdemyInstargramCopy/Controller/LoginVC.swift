//
//  LoginVC.swift
//  UdemyInstargramCopy
//
//  Created by Wi on 18/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    let logoContainerView: UIView = {
        let view = UIView()
        let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Instagram_logo_white"))
        logoImageView.contentMode = .scaleAspectFill
        view.addSubview(logoImageView)
        logoImageView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 50)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        view.backgroundColor = UIColor(red: 0/255, green: 120/255, blue: 175/255, alpha: 1)
        
        return view
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    let loginButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(red: 149/255, green: 204/255, blue: 244/255, alpha: 1)
        btn.layer.cornerRadius = 5
        return btn
    }()

    let dontHaveAccountButton: UIButton = {
        let btn = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: "Don't have and account?  ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSMutableAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor(red: 17/255, green: 154/255, blue: 237/255, alpha: 1)]))
        btn.setAttributedTitle(attributedTitle, for: .normal)
        btn.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure(){
        
        // hide nav bar
        navigationController?.navigationBar.isHidden = true
        
        // logo
        view.addSubview(logoContainerView)
        logoContainerView.anchor(top: view.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 150)
        
        // background color
        view.backgroundColor = .white
        
        //stackView
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,loginButton])
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        
        stackView.anchor(top: logoContainerView.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, paddingTop: 40, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 140)
        
        // signup Btn
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(top: nil, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        
    }
    
    // MARK: Action
    
    @objc func  handleShowSignUp(){
        let signUpVC = SignUpVC()
        show(signUpVC, sender: nil)
    }
    

}
