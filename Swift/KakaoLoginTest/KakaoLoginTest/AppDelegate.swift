//
//  AppDelegate.swift
//  KakaoLoginTest
//
//  Created by Wi on 22/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initializeApp()
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        KOSession.handleDidEnterBackground()
    }
    func applicationDidBecomeActive(_ application: UIApplication) {
        KOSession.handleDidBecomeActive()
    }
    func application(_ app: UIApplication, open url: URL, options:
        [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if KOSession.isKakaoAccountLoginCallback(url) {
            return KOSession.handleOpen(url)
        }
        return false
    }
    
    // Initialize App

    func initializeApp(){
        setupSessionChangeNotification()
        setupRootViewController()
    }
    private func setupSessionChangeNotification(){
        NotificationCenter.default.addObserver(forName: .KOSessionDidChange, object: nil, queue: .main) { [unowned self](noti) in
            guard let session = noti.object as? KOSession else {return}
            session.isOpen() ? print("Login") : print("Logout")
            self.setupRootViewController()
        }
    }
    private func setupRootViewController(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let storyboardID = KOSession.shared().isOpen() ? "MainViewController" : "LoginViewController"
        let vc = storyboard.instantiateViewController(withIdentifier: storyboardID)
        navigationController.viewControllers = [vc]
        window?.rootViewController = navigationController
    }
}

