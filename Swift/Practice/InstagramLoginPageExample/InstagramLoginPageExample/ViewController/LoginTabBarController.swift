//
//  CustumTabBarController.swift
//  InstagramLoginPageExample
//
//  Created by Wi on 24/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class LoginTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let login = LoginViewController()
        self.viewControllers = [login]
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
