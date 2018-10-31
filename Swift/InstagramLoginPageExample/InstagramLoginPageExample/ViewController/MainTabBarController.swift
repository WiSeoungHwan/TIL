//
//  MainTabBarController.swift
//  InstagramLoginPageExample
//
//  Created by Wi on 31/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createViewControllers()
    }
    func createViewControllers(){
        let home = HomeViewController()
        let search = SearchViewController()
        let add = AddViewController()
        let heart = HeartViewController()
        let myFeed = MyFeedViewController()
        
        self.viewControllers = [home, search, add, heart, myFeed]
        home.tabBarItem.image = UIImage(named: "home")?.withRenderingMode(.alwaysOriginal)
        search.tabBarItem.image = UIImage(named: "search")?.withRenderingMode(.alwaysOriginal)
        add.tabBarItem.image = UIImage(named: "add")?.withRenderingMode(.alwaysOriginal)
        heart.tabBarItem.image = UIImage(named: "heart")?.withRenderingMode(.alwaysOriginal)
        myFeed.tabBarItem.image = UIImage(named: "myFeed")?.withRenderingMode(.alwaysOriginal)

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
