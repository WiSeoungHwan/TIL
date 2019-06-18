//
//  CustomTabBarViewController.swift
//  CustomTabBar
//
//  Created by Wi on 18/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class CustomTabBarViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CustomTabBar"
        configureCustomTabBar()
    }
    
    private func configureCustomTabBar(){
        let menuBar = MenuBar()
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuBar)
        
        let guide = view.safeAreaLayoutGuide
        menuBar.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

}
