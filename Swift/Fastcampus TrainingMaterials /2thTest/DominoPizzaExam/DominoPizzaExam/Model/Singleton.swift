//
//  WichListData.swift
//  DominoPizzaExam
//
//  Created by Kira on 19/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import Foundation

class Singleton {
    static let shared = Singleton()
    private init() {}
    
    var wishListDict: [String: Int] = [:]
}
