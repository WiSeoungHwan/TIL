//
//  User.swift
//  KakaoLoginTest
//
//  Created by Wi on 22/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import Foundation

struct User: Decodable {
    let id: String
    let nickname: String
    let profileImage: String
    let thumbnailImage: String
    
    enum Properties: String, CodingKey {
        case nickname
        case profileImage = "profile_image"
        case thumbnailImage = "thumbnail_image"
    }
}
