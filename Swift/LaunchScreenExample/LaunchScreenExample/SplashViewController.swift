//
//  SplashViewController.swift
//  LaunchScreenExample
//
//  Created by Wi on 23/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "main")
        return imageView
    }()
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SwiFood"
        label.textColor = .white
        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 40)
        label.font = UIFont(name: "Palatino", size: 40)
        
        label.alpha = 0
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("splash")
        autolayout()
        // label의 알파를 천천히 바꾸는 거
        UIView.animate(withDuration: 0.5) { [weak label = self.label] in
            label?.alpha = 1
        }
        // 3초 뒤에 뷰 컨트롤러를 띄우는거
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
           let appDelegate =  UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = ViewController()
        }
    }
    
    func autolayout(){
        view.addSubview(imageView)
        view.addSubview(label)
        
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
    }
}
