//
//  AppDelegate.swift
//  myApp
//
//  Created by Wi on 30/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        print(url) // 다른 앱에서 실행시켯을 떄 데이터 가 넘어옴
        print(url.scheme) //앱의 scheme
        print(url.query) //넘어온 데이터
        print("sourceApplication: ", options[.sourceApplication] ?? "") // 호출한 앱의 BundleID
        print("sourceApplication: ", options[.openInPlace] as! Bool)
        print("sourceApplication: ", options[.annotation] ?? "")


        return true
    }

}

