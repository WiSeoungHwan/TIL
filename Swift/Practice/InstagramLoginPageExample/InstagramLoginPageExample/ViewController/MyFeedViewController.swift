//
//  MyFeedViewController.swift
//  InstagramLoginPageExample
//
//  Created by Wi on 24/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class MyFeedViewController: UIViewController {
    let myFeed = MyFeedView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        myFeed.delegate = self
        myFeed.frame = view.frame
        view.addSubview(myFeed)
        UserInfo.singleton.loadFeed()
        
        
    }
    func createAddFeedAlert(){
        let addFeedAlertController = UIAlertController(title: "Add Feed", message: "내용", preferredStyle: .alert)
        addFeedAlertController.addTextField()
        let okAction = UIAlertAction(title: "ok", style: .default){ _ in
            UserInfo.singleton.addFeed(feed: addFeedAlertController.textFields?[0].text ?? "")
            self.myFeed.feedTable.reloadData()
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        addFeedAlertController.addAction(okAction)
        addFeedAlertController.addAction(cancelAction)
        present(addFeedAlertController, animated: true)
    }
}
extension MyFeedViewController: MyFeedViewDelegate{
    func addFeedBtnDidTab() {
        createAddFeedAlert()
    }
    func logoutBtnDidTab() {
        dismiss(animated: true, completion: nil)
    }
    
}
