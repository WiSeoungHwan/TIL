//
//  SecondViewController.swift
//  CafeGame
//
//  Created by Wi on 2018. 9. 26..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    let menu = UILabel()
    let order = UIButton()
    let totalPriceTextView = UITextView()
//    let backBarButtonItem: UIBarButtonItem = {
//        let barButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: #selector(backBtnDidtap))
//        return barButtonItem
//    }() 안됨
    var americano = CafeMenu(menuName: "Americano", price: 4000)
    var latte = CafeMenu(menuName: "Latte", price: 4500)
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .brown
        menu.backgroundColor = .brown
        menu.frame = CGRect(x: 40, y: 60, width: 100, height: 100)
        menu.textColor = .white
        menu.shadowColor = .black
        menu.font = UIFont.systemFont(ofSize: CGFloat(40))
        menu.text = "Menu"
        menu.textAlignment = .center
        view.addSubview(menu)
        navigationController?.navigationBar.isHidden = false // 네비게이션 들어내기
        totalPriceTextView.backgroundColor = .white
        totalPriceTextView.frame = CGRect(x: 50, y: 450, width: 300, height: 200)
        //totalPriceTextView.text = 
        view.addSubview(totalPriceTextView)
        
        addMenuImage(menu: americano, imageName: "americano", rect1: CGRect(x: 50, y: 150, width: 100, height: 120))
        addMenuImage(menu: latte, imageName: "latte", rect1: CGRect(x: 200, y: 150, width: 100, height: 120))
       
        
        
        order.backgroundColor = .orange
        order.frame = CGRect(x: 100, y: 700, width: 200, height: 50)
        order.setTitle("주문!", for: .normal)
        
        
        view.addSubview(order)
        
//        navigationItem.leftBarButtonItem = backBarButtonItem
        
        
        
        
    }
    // 버튼 눌렸을 때 가격 추가 되는 창 만들기
    func addMenuImage(menu: CafeMenu,imageName: String, rect1: CGRect){
        let menuImage = UIImage(named: imageName)
        menu.addMenu(image: menuImage!, rect: rect1)
        view.addSubview(menu.menuImageView)
        view.addSubview(menu.menuButton)
        view.addSubview(menu)
        
    }
    
    
    
//    @objc func backBtnDidtap(){
//        print("backBtn did tap")
//        navigationController?.popToRootViewController(animated: true)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
