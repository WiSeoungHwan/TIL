//
//  CustomTabBarController.swift
//  TabBarControllerExample
//
//  Created by Wi on 2018. 10. 5..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let aViewController = AViewController()
        
        let navi = UINavigationController(rootViewController: aViewController)
        
        let bVC = BViewController()
        let cVC = CViewController()
        self.viewControllers = [navi, bVC, cVC]
        bVC.tabBarItem.title = "B"
        cVC.tabBarItem.title = "C"
        

        bVC.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
        cVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        
        
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



