//
//  ViewController.swift
//  AutoLayoutLoginPageOnlyCode
//
//  Created by Wi on 15/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var imageView = UIImageView(image: UIImage(named: "logo"))
        var userTextField = UITextField()
        var pwTextField = UITextField()
        view.addSubview(imageView)
        view.addSubview(userTextField)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        userTextField.translatesAutoresizingMaskIntoConstraints = false


        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        
//        imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -500).isActive = true
        
        
        userTextField.backgroundColor = .gray
        userTextField.leftView = UIImageView(image: UIImage(named: "userIcon"))
        userTextField.leftViewMode = .always
        userTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 200).isActive = true
        userTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        userTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        userTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        pwTextField.backgroundColor = .gray
        pwTextField.leftView = UIImageView(image: UIImage(named: "passwordIcon"))
        pwTextField.leftViewMode = .always
        pwTextField.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 50).isActive = true
        pwTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        pwTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50).isActive = true
        
       
        
        
        
        
        
        
        
        
        
    }


}

