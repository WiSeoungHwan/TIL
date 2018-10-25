//
//  UserInfo.swift
//  InstagramLoginPageExample
//
//  Created by Wi on 17/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import Foundation

class UserInfo{
    static var singleton = UserInfo()
    var id: String?
    private var pw: String?
    var feeds: [String] = []
    private init() {}
    
    func signUp(id: String, password: String){

    }
    func login(id: String, password: String) -> Bool{

    }
    func loadFeed(){

    }
    func addFeed(feed: String) {

    }
    func remove(index: Int){

    }
    
    
}
