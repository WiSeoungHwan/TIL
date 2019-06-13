//
//  FeedVC.swift
//  UdemyInstargramCopy
//
//  Created by Wi on 25/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit
import Firebase

private let reuseIdentifier = "Cell"

class FeedVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    // MARK: - Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        // register cell classes
        self.collectionView!.register(FeedCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // configure logout btn
        
        configureNavBar()
    }

    // MARK: - UIColectionViewFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        var height = width + 8 + 40 + 8
        height += 50
        height += 60
        return CGSize(width: width, height: height)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FeedCell
    
        return cell
    }
    
    // MARK: - Handlers
    @objc func handleShowMessages(){
        print("send button tap")
    }
    
    func configureNavBar(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "send2"), style: .plain, target: self, action: #selector(handleShowMessages))
        
        self.navigationItem.title = "Feed"
    }
    
    
    
    // MARK: Action
    
    @objc func handleLogout(){
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // add logout action
        
        alertController.addAction(UIAlertAction(title: "Logout", style: .destructive, handler: { (_) in
            do{
                // sign out
                try Auth.auth().signOut()
                let loginVC = LoginVC()
                let navController = UINavigationController(rootViewController: loginVC)
                self.present(navController, animated: true, completion: nil)
                print("Successfully logout")
            }catch{
                print("failed to sign out")
            }
        }))
        // add cancel action
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alertController, animated: true, completion: nil)
        
        
        
        
    }

}
