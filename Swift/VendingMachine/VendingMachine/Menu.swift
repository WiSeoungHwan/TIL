//
//  Menu.swift
//  VendingMachine
//
//  Created by Wi on 2018. 10. 8..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class Menu: UIViewController{
    var name: String
    var price: Int
    var image: String
    init(name: String, price: Int, image: String) {
        self.name = name
        self.price = price
        self.image = image
    }
}
