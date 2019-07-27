//
//  User.swift
//  FeedExample
//
//  Created by Wi on 31/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import Foundation

struct User{
    var id: String
    var pw: String
    var feeds: [Feed]
    
    //실패 가능한 이니셜라이즈 실패하면 닐 반환
    init?(dictionary: [String: Any]) {
        guard let profile = dictionary["Profile"] as? [String: String] else {return nil}
        guard let id = profile["ID"] else {return nil }
        guard let pw = profile["PW"] else {return nil }
        self.id = id
        self.pw = pw

        guard let feeds = dictionary["Feeds"] as? [[String:String]] else {return nil}
        var temp: [Feed] = []
        for feed in feeds{
            temp.append(Feed(dictionary: feed)!)
        }
        self.feeds = temp
    }
}
