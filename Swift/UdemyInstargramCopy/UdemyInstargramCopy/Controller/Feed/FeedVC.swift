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

class FeedVC: UICollectionViewController, UICollectionViewDelegateFlowLayout, FeedCellDelegate{
    
    // MARK: - Properties
    
    var posts = [Post]()
    var viewSinglePost = false
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        // register cell classes
        self.collectionView!.register(FeedCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // configure logout btn
        configureNavBar()
        
        // fetch posts
        if !viewSinglePost{
            fetchPosts()
        }
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
        if viewSinglePost {
            return 1
        } else {
            return posts.count
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FeedCell
        
        cell.delegate = self
        
        if viewSinglePost {
            if let post = self.post {
                cell.post = post
            }
        } else {
            cell.post = posts[indexPath.row]
        }
        
        
        return cell
    }
    
    // MARK: - FeedCellDelegate
    
    func handleUsernameTapped(for cell: FeedCell) {
        
        guard let post = cell.post else {return}
        
        let userProfileVC = UserProfileVC(collectionViewLayout: UICollectionViewFlowLayout())
        userProfileVC.user = post.user
        
        navigationController?.pushViewController(userProfileVC, animated: true)
    }
    
    func handleOptionsTapped(for cell: FeedCell) {
        print("handel o tapped")
    }
    
    func handleLikeTapped(for cell: FeedCell) {
        print("handel l tapped")
    }
    
    func handleCommentTapped(for cell: FeedCell) {
        print("handel c tapped")
    }
    
    // MARK: - Handlers
    
    @objc func handleShowMessages(){
        print("send button tap")
    }
    
    // MARK: - Configuration
    
    func configureNavBar(){
        
        if !viewSinglePost{
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        }
        
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
    
    // MARK: - API
    
    func fetchPosts(){
        
        print("Fetch post function called")
        
        POSTS_REF.observe(.childAdded) { (snapshot) in
            
            let postId = snapshot.key
            
            Database.fetchPost(with: postId, completion: { (post) in
                
                self.posts.append(post)
                
                self.posts.sort(by: { (post1, post2) -> Bool in
                    return post1.creationDate > post2.creationDate
                })
                
                self.collectionView.reloadData()
            })
            
            
        }
    }

}
