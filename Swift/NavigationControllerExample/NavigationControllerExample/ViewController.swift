//
//  ViewController.swift
//  NavigationControllerExample
//
//  Created by Wi on 2018. 10. 5..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.hidesBarsOnTap = true
        navigationItem.title = "Navigation Title"
        
        // 타이틀이 커짐
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 200, width: 100, height: 50)
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        button.setTitle("Button", for: .normal)
        button.backgroundColor = .gray
        
        view.addSubview(button)
        
    }

    @objc func buttonDidTap(){
        let secondVC = SecondViewController()
        //네비게이션 아닐수 있으니 옵셔널 체이닝
//        navigationController?.pushViewController(secondVC, animated: true)
        show(secondVC,sender: nil) // 네비게이션일떄는 푸시 아닐때는 present방식으로 작동한다.
    }
}

