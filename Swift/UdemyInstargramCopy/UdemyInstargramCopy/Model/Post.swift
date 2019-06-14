//
//  Post.swift
//  UdemyInstargramCopy
//
//  Created by Wi on 09/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation

class Post{
    var caption: String!
    var likes: Int!
    var imageUrl: String!
    var ownerUid: String!
    var creationDate: Date!
    var postId: String!
    var user: User?
    
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
}
