//
//  ContentViewController.swift
//  StatusBarAndIndicatorExample
//
//  Created by Wi on 15/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    private var statusBarStyle = UIStatusBarStyle.default
    private var isStatusBarHidden = false
    private var isHomeIndicatorAutoHidden = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return statusBarStyle // stataus Bar 를 배경 색에 따라 보이게 바꿈
    }
    override var prefersStatusBarHidden: Bool{
        return isStatusBarHidden
    }
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return .slide
    }
    override var prefersHomeIndicatorAutoHidden: Bool{
        return isHomeIndicatorAutoHidden
    }
    
    @IBAction func toggleStatusBarStyle(_ sender: Any) {
        let isDefault = statusBarStyle == .default
        statusBarStyle = isDefault ? .lightContent : .default
        UIView.animate(withDuration: 0.5) {
            self.view.backgroundColor = !isDefault ? .white : .darkGray
            self.setNeedsStatusBarAppearanceUpdate()// 중간에 변경이 되게 하려면 이 함수 실행
        }
    }
    //Status Bar Hidden
    @IBAction func toggleStatusBarHidden(_ sender: Any) {
        isStatusBarHidden.toggle()
        UIView.animate(withDuration: 0.5) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    @IBAction func toggleHomeIndicatorHIdden(_ sender: Any) {
        isHomeIndicatorAutoHidden.toggle()
        setNeedsUpdateOfHomeIndicatorAutoHidden()
        
        navigationController?.navigationBar.isHidden.toggle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
