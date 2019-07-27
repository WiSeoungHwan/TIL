//
//  DetailViewController.swift
//  DominoPizza
//
//  Created by Kira on 18/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var menuName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "주문하기"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        label.text = "\(WishListClass.singleton.wishList[menuName]?.number ?? 0) 개"
        menuImageView.image = UIImage(named: menuName)
    }
    
    @IBAction func plusButtonDidTap(_ sender: Any) {
        if isMenuSelected(name: menuName){
            print("\(menuName) 1 증가")
            WishListClass.singleton.wishList[menuName]!.number += 1
        }else {
            print("\(menuName) 생성 ")
            WishListClass.singleton.wishList[menuName] =
                WishListClass.WishListStruct(name: menuName, number: 1)
        }
        label.text = "\(WishListClass.singleton.wishList[menuName]!.number) 개"
      
    }
    
    @IBAction func minusBtnDidTap(_ sender: Any) {
        if WishListClass.singleton.wishList[menuName]?.number ?? 0 > 0{
        if isMenuSelected(name: menuName){
            print("\(menuName) 1 감소")
            WishListClass.singleton.wishList[menuName]!.number -= 1
        }
        label.text = "\(WishListClass.singleton.wishList[menuName]?.number ?? 0) 개"
        }
    }
    
    func isMenuSelected(name: String) -> Bool{
        return WishListClass.singleton.wishList.contains{$0.key == menuName}
        
    }
}
