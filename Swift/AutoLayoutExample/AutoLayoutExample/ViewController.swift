//
//  ViewController.swift
//  AutoLayoutExample
//
//  Created by Wi on 15/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let leftView = UIView()
    let rightView = UIView()
    let margin: CGFloat = 20
    override func viewDidLoad() {
        super.viewDidLoad()
        leftView.translatesAutoresizingMaskIntoConstraints = false
        rightView.translatesAutoresizingMaskIntoConstraints = false
        leftView.backgroundColor = .red
        rightView.backgroundColor = .blue
        view.addSubview(leftView)
        view.addSubview(rightView)
        
        
        leftView.topAnchor.constraint(equalTo: view.topAnchor, constant: margin).isActive = true
//        leftView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        leftView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        leftView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -margin).isActive = true
        leftView.trailingAnchor.constraint(equalTo: rightView.leadingAnchor, constant: -10).isActive = true
        leftView.widthAnchor.constraint(equalTo: rightView.widthAnchor, multiplier: 1).isActive = true
        
//        rightView.leadingAnchor.constraint(equalTo: leftView.trailingAnchor, constant: -10).isActive = true
        rightView.topAnchor.constraint(equalTo: view.topAnchor, constant: margin).isActive = true
//        rightView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        rightView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive = true
        rightView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -margin).isActive = true
        
        
        
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        //frame 으로 하는 방법
//        let margin: CGFloat = 20
//        let screenSize = UIScreen.main.bounds
//        var leftView = UIView(frame: CGRect(x: margin , y: margin , width: screenSize.maxX / 2 - 30 , height: screenSize.maxY - margin * 2 ))
//        leftView.backgroundColor = .red
//        print(leftView.frame.width)
//        view.addSubview(leftView)
//
//        var rightView = UIView(frame: CGRect(x: screenSize.maxX / 2  , y: 20 , width: screenSize.maxX / 2 - 30, height: screenSize.maxY - 40 ))
//        print(rightView.frame.width)
//        rightView.backgroundColor = .blue
//        view.addSubview(rightView)
        
    }

}

