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
        
        loginView.translatesAutoresizingMaskIntoConstraints = false        
        loginView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        loginView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        loginView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
        loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true

    }
    
    
    

    

}
