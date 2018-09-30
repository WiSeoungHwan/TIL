//
//  SecondViewController.swift
//  CafeGame
//
//  Created by Wi on 2018. 9. 26..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    let menu = UILabel()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .brown
        menu.backgroundColor = .brown
        menu.frame = CGRect(x: 40, y: 40, width: 100, height: 100)
        menu.textColor = .white
        menu.shadowColor = .black
        menu.font = UIFont.systemFont(ofSize: CGFloat(40))
        menu.text = "Menu"
        menu.textAlignment = .center
        view.addSubview(menu)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
