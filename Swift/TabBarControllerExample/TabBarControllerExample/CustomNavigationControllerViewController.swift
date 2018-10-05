//
//  CustomNavigationControllerViewController.swift
//  TabBarControllerExample
//
//  Created by Wi on 2018. 10. 5..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class CustomNavigationControllerViewController: UINavigationController {

    @objc func someMethod() {
        let someView = SomeViewController()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let aVC = AViewController()
        let rightBtn = UIBarButtonItem(title: "Right", style: .done, target: self, action: #selector(someMethod))
        
        self.viewControllers = [aVC]
        aVC.navigationItem.setRightBarButton(rightBtn, animated: true)
        aVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        aVC.tabBarItem.title = "A"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
