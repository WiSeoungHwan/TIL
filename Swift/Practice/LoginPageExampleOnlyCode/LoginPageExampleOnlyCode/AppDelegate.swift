//
//  AppDelegate.swift
//  LoginPageExampleOnlyCode
//
//  Created by Wi on 2018. 10. 5..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        var isOnRememberSwitch = UserDefaults.standard.value(forKey: "RememberMe") != nil
        guard isOnRememberSwitch == true  else {let navi = UINavigationController(rootViewController: SecondViewController())
            return false}
        let navi = UINavigationController(rootViewController: LoginViewController())

        
        navi.isNavigationBarHidden = true
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
        
        return true
    }





}

