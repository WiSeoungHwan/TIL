//
//  Post.swift
//  UdemyInstargramCopy
//
//  Created by Wi on 09/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation
import Firebase

class Post{
    var caption: String!
    var likes: Int!
    var imageUrl: String!
    var ownerUid: String!
    var creationDate: Date!
    var postId: String!
    var user: User?
    var didLike = false
    
    init(postId: String!, user: User, dictionary: Dictionary<String,AnyObject>) {
        
        self.postId = postId
        self.user = user
        
        if let caption = dictionary["caption"] as? String{
            self.caption = caption
        }
        
        if let likes = dictionary["likes"] as? Int{
            self.likes = likes
        }
        
        if let imageUrl = dictionary["imageUrl"] as? String{
            self.imageUrl = imageUrl
        }
        
        if let ownerUid = dictionary["ownerUid"] as? String{
            self.ownerUid = ownerUid
        }
        
        if let creationDate = dictionary["creationDate"] as? Double {
            self.creationDate = Date(timeIntervalSince1970: creationDate)
        }
    }
    
    func addjustLikes(addLike: Bool){
        
        if addLike{
            likes = likes + 1
            didLike = true
        } else {
            guard likes > 0 else {return}
            likes = likes - 1
            didLike = false
        }
        
        POSTS_REF.child(postId).child("likes").setValue(likes)
        
    }
}
