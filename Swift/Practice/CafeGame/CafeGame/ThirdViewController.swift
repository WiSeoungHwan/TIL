//
//  thirdViewController.swift
//  CafeGame
//
//  Created by Wi on 2018. 9. 30..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    let thanksLabel = UILabel()
    override func viewDidLoad() {
        view.backgroundColor = .brown
        thanksLabel.frame = CGRect(x: 30, y: 300, width: 300, height: 400)
        thanksLabel.textColor = .white
        thanksLabel.font = UIFont.systemFont(ofSize: 30)
        thanksLabel.text = "감사합니다."
        
        
        view.addSubview(thanksLabel)
    }
    
    
}
