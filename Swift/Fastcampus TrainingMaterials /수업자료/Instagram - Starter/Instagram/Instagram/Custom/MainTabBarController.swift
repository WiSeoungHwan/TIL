//
//  MainViewController.swift
//  Instagram
//
//  Created by Wi on 29/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit
// VC들을 가지고있을 탭바입니다.
// 탭바컨트롤러에서 어떤일을 해야할지 생각해보세요.

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    // MARK: - Properties
    // 탭바에 넣을 VC  만들기
    let plusVC = PlusViewController()
    let homeVC = HomeViewController()
    let myVC = MyViewController()

    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // VC 넣기
        viewControllers = [UINavigationController(rootViewController: homeVC), plusVC, UINavigationController(rootViewController: myVC)]
        
        // 탭바 아이템 정하기
        
        homeVC.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "home_nomal"), selectedImage: #imageLiteral(resourceName: "home_selected"))
        plusVC.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "plus"), selectedImage: nil)
        myVC.tabBarItem = UITabBarItem(title: "MY", image: nil, selectedImage: nil)
        myVC.title = "MY"
    }
    
    // 탭바를 선택했을때 불릴 함수 입니다.
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
