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
    
    
    /// Description
    ///
    /// - Parameters:
    ///   - id: id is for in UserDefaults set
    ///   - password: password is for in UserDefaults set
    func signUp(id: String, password: String){
        UserDefaults.standard.set([password : [String]()], forKey: id)
        UserDefaults.standard.synchronize()
    }
    
    /// Description
    ///
    /// - Parameters:
    ///   - id: is for login.
    ///   - password: is for login.
    /// - Returns: is success login. true : false
    func login(id: String, password: String) -> Bool{
        let userDictionary = UserDefaults.standard.value(forKey: id) as? [String: [String]]
        guard let pw = userDictionary?.keys else {return false}
        print(pw)
        for i in pw{
            if password == i{
                self.id = id
                self.pw = password
                return true
            }
        }
        return false
    }
    
    
    /// Description
    /// if successed login , the load current user's data.
    func loadFeed(){
        let userDictionary = UserDefaults.standard.value(forKey: self.id ?? "" ) as? [String: [String]]
        guard let feed = userDictionary?[pw ?? ""] else {return}
        self.feeds = feed
    }
    
    /// Description
    ///
    /// - Parameter feed: add  to self.feed  and update user's feed
    func addFeed(feed: String) {
        self.feeds.append(feed)
        print(self.feeds)
        guard var userDictionary = UserDefaults.standard.value(forKey: self.id ?? "" ) as? [String: [String]] else {return}
        userDictionary.updateValue(self.feeds, forKey: self.pw!)
        UserDefaults.standard.setValue(userDictionary, forKey: id!)
        UserDefaults.standard.synchronize()
        print(userDictionary)
    }

    /// Description
    ///
    /// - Parameter index: this index is cell's index.row in TableView 
    func remove(index: Int){
        self.feeds.remove(at: index)
        print(self.feeds)
        guard var userDictionary = UserDefaults.standard.value(forKey: self.id ?? "" ) as? [String: [String]] else {return}
        userDictionary.updateValue(self.feeds, forKey: self.pw!)
        UserDefaults.standard.setValue(userDictionary, forKey: id!)
        UserDefaults.standard.synchronize()
        print(userDictionary)
    }
    
    
}
