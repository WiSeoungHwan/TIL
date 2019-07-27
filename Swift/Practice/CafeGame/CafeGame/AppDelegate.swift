//
//  AppDelegate.swift
//  CafeGame
//
//  Created by Wi on 2018. 9. 26..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController? // 네비게이션 컨트롤러 변수 선언하기

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            let mainVC = ViewController()
            navigationController = UINavigationController(rootViewController: mainVC)//네비게이션
            navigationController?.navigationBar.isHidden = true// 네비게이션 바 숨김 여부
            window.rootViewController = navigationController //rootView에다 navigation을 넣는다.
            window.makeKeyAndVisible()
        }
        return true
    }

    

}

