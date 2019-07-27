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
    

    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 탭바를 선택했을때 불릴 함수 입니다.
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
