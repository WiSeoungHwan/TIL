//
//  ViewController.swift
//  CafeGame
//
//  Created by Wi on 2018. 9. 26..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let name = UITextField()
    let completeButton = UIButton()
    let svc = SecondViewController()
    public var userName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        name.frame = CGRect(x: 100, y: 400, width: 200, height: 50)
        name.backgroundColor = .white
        name.textColor = .black
        name.placeholder = "이름을 입력해주세요"
        view.addSubview(name)
        
        completeButton.frame = CGRect(x: 180, y: 460, width: 50, height: 50)
        completeButton.backgroundColor = .white
        completeButton.setTitleColor(.blue, for: .normal)
        completeButton.setTitle("완료", for: .normal)
        completeButton.addTarget(self, action: #selector(completButtonDidTap), for: .touchUpInside)
        view.addSubview(completeButton)
        
    }
    
    @objc func completButtonDidTap(){
        completeButton.setTitleColor(.gray, for: .selected)
        userName = name.text
        present(svc, animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

