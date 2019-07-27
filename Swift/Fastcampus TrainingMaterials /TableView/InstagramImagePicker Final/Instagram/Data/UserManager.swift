//
//  UserManager.swift
//  Instagram
//
//  Created by Wi on 07/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class UserManager{
    // 싱글톤으로 만들어줍니다.
    static let shard = UserManager()
    // 유저디폴트 사용
    private var userDefaults = UserDefaults.standard

    // 유저 변수 만들기
    private var user = User(userName: "", profileImage: nil)
    // 매니저 생성 막기
    private init(){}
    
    
    // 닉네임 중복검사 및 닉네임을 변경합니다.
    func changeUserName(userName: String, completion: (Bool, String) -> ()){
        guard let localUserData = userDefaults.array(forKey: "userName"), var userNames = localUserData as? [String]
            else {
                userDefaults.set([userName], forKey: "userName")
                self.user.userName = userName
                completion(true, userName)
                return
        }
        if userNames.contains(userName){
            completion(false, "중복된 닉네임이 있습니다.")
            return
        }
        userNames.append(userName)
        userDefaults.setValue(userNames, forKey: "userName")
        self.user.userName = userName
        completion(true,userName)
    }
    
    // 유저의 정보를 반환하는 함수
    func getUserInfo(completion: (User) ->()){
        completion(user)
    }
    // 유저의 정보를 바꾸고 변경된 유저를 반환하는 함수
    func changeUserInfo(user: User, completion:(User) ->()){
        self.user = user
        completion(self.user)
    }
}
