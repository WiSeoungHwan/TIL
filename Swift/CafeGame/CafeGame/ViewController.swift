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
    let titleImageView = UIImageView()
    let titleImage = UIImage(named: "title")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        navigationController?.navigationBar.isHidden = true
        // self.title = "시작화면"
        name.frame = CGRect(x: 100, y: 400, width: 200, height: 50)
        name.backgroundColor = .white
        name.textColor = .black
        name.placeholder = "이름을 입력해주세요"
        view.addSubview(name)
        
        titleImageView.frame = CGRect(x: 60, y: 80, width: 300, height: 300)
        titleImageView.image = titleImage
        view.addSubview(titleImageView)
        
        completeButton.frame = CGRect(x: 180, y: 460, width: 50, height: 50)
        completeButton.backgroundColor = .white
        completeButton.setTitleColor(.blue, for: .normal)
        completeButton.setTitle("완료", for: .normal)
        completeButton.addTarget(self, action: #selector(completButtonDidTap), for: .touchUpInside)
        view.addSubview(completeButton)
        
    }
    
    @objc func completButtonDidTap(){
        completeButton.setTitleColor(.gray, for: .selected)
        SecondViewController.userName = name.text
        navigationController?.pushViewController(SecondViewController(), animated: true)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

