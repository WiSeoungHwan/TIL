//
//  AppDelegate.swift
//  CafeGame
//
//  Created by Wi on 2018. 9. 26..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController1: UINavigationController? // 네비게이션 컨트롤러 변수 선언하기

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            let mainVC = ViewController()
            navigationController1 = UINavigationController(rootViewController: mainVC)
            navigationController1?.navigationBar.isHidden = true// 네비게이션 바 숨김 여부
            window.rootViewController = navigationController1
            window.makeKeyAndVisible()
        }
        return true
    }

    

}

