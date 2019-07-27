//
//  UserData.swift
//  SingletonExample
//
//  Created by Wi on 10/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation

class UserData {
    static let singleton = UserData()
    
    var userName: String = ""
    var password: String = ""
    var age: String = ""
    var phoneNumber: String = ""
    
    private init() {}
    
}
