//
//  AViewController.swift
//  TabBarControllerExample
//
//  Created by Wi on 2018. 10. 5..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class AViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       let rightBtn = UIBarButtonItem(title: "Right", style: .done, target: self, action: #selector(someMethod))
        self.navigationItem.setRightBarButton(rightBtn, animated: true)
        self.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        self.tabBarItem.title = "A"
    }
    
    @objc func someMethod() {
        let viewController = SomeViewController()
        navigationController?.pushViewController(viewController, animated: true)
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
