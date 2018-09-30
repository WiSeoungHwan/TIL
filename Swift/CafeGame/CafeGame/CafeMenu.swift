//
//  CafeMenu.swift
//  CafeGame
//
//  Created by Wi on 2018. 9. 30..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class CafeMenu : UIView{
    var menuName: String
    var price: Int
    var menuButton = UIButton()
    var menuImageView = UIImageView()
    init(menuName: String, price: Int){
        self.menuName = menuName
        self.price = price
        super.init(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func addMenu(image: UIImage, rect: CGRect){
        menuImageView.image = image
        menuImageView.frame = rect
        menuButton.frame = CGRect(x: rect.origin.x, y: rect.origin.y + 100 , width: rect.width, height: 40)
        menuButton.setTitle(menuName, for: .normal)
        menuButton.backgroundColor = .red
        
        print("addMenu")
    }
    
}
