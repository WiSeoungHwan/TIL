//
//  WishListClass.swift
//  DominoPizza
//
//  Created by Wi on 21/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import Foundation

class WishListClass {
    static let singleton = WishListClass()
    
    var wishList: [String: WishListStruct] = [:]
    
    struct WishListStruct{
        var name = ""
        var number:Int = 0
    }
    func dataSetting() -> [WishListClass.WishListStruct]{
        var arr = [WishListClass.WishListStruct]()
        for value in self.wishList.values{
            print(value)
            arr.append(value)
        }
        return arr
    }
    func returnWishListString() -> String{
        var arr = ""
        for value in self.wishList.values{
            print(value)
            arr.append("\(value.name)\n")
        }
        return arr
    }
    private init() {}
}
