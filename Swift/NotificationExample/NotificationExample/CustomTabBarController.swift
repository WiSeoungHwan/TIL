//
//  CustomTabBarController.swift
//  NotificationExample
//
//  Created by Wi on 23/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let aView = AViewController()
        let bView = BViewController()
        self.viewControllers = [aView,bView]
        aView.tabBarItem.title = "A"
        bView.tabBarItem.title = "B"
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
