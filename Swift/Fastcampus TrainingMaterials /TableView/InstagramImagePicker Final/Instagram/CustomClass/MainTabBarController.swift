//
//  MainViewController.swift
//  Instagram
//
//  Created by Wi on 05/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

// 탭바컨트롤러 델리게이트를 채택해줍니다.
class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    let homeVC = HomeViewController()
    let plusVC = PlusViewController()
    let myVC = MyViewController()
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 델리게이트 작업해주기
        picker.delegate = self
        self.delegate = self
        
        
        homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: AppImageData.homeNomal), selectedImage: UIImage(named: AppImageData.homeSelected))
        plusVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: AppImageData.plus), selectedImage: UIImage(named: AppImageData.plus))
        
        viewControllers = [UINavigationController(rootViewController: homeVC), plusVC, UINavigationController(rootViewController: myVC)]
        
        // 탭바 타이틀 공간 없애는 코드입니다. (옵셔널)
        for i in tabBar.items!{
            i.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
    }
    
    // 탭바 아이템을 선택했을때 불리는 함수 입니다. true일때 선택되고 false면 선택되지 않습니다.
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        // 선택한 뷰컨트롤러가 +VC 일때만 포토 라이브러리를 띄워요.
        if viewController == plusVC{
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true)
            return false
        }
        return true
    }

}

extension MainTabBarController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        NotificationCenter.default.post(name: Notification.Name("photoSelected"), object: nil, userInfo: ["image": info[.originalImage]])
        picker.dismiss(animated: true)
    }
}

