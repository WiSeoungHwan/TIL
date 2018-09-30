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
    var totalPrice: Int = 0
    public static var userName: String? //static으로 안하니까 안되더라 
//    let backBarButtonItem: UIBarButtonItem = {
//        let barButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: #selector(backBtnDidtap))
//        return barButtonItem
//    }() 안됨
    var americano = CafeMenu(menuName: "Americano", price: 4000)
    var latte = CafeMenu(menuName: "Latte", price: 4500)
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .brown
        navigationController?.navigationBar.isHidden = false // 네비게이션 들어내기
        
        menu.backgroundColor = .brown
        menu.frame = CGRect(x: 40, y: 60, width: 100, height: 100)
        menu.textColor = .white
        menu.shadowColor = .black
        menu.font = UIFont.systemFont(ofSize: CGFloat(40))
        menu.text = "Menu"
        menu.textAlignment = .center
        view.addSubview(menu)
        
        
        totalPriceTextView.backgroundColor = .white
        totalPriceTextView.frame = CGRect(x: 50, y: 450, width: 300, height: 200)
        if let name = SecondViewController.userName{
            totalPriceTextView.text = "\(name) 님의 주문 내역입니다. \n"
        }else{
            totalPriceTextView.text = "고객 님의 주문 내역입니다. \n"
        }
        view.addSubview(totalPriceTextView)
        
        addMenuImage(menu: americano, imageName: "americano", rect1: CGRect(x: 50, y: 150, width: 100, height: 120))
        addMenuImage(menu: latte, imageName: "latte", rect1: CGRect(x: 200, y: 150, width: 100, height: 120))
        americano.menuButton.addTarget(self, action: #selector(menuBtnDidTap), for: .touchUpInside)
        latte.menuButton.addTarget(self, action: #selector(menuBtnDidTap), for: .touchUpInside)
        
        
        order.backgroundColor = .orange
        order.frame = CGRect(x: 100, y: 700, width: 200, height: 50)
        order.setTitle("주문!", for: .normal)
        order.addTarget(self, action: #selector(orderBtnDidTap), for: .touchUpInside)
        
        
        
        view.addSubview(order)
        
//        navigationItem.leftBarButtonItem = backBarButtonItem
        
        
        
        
    }
    
    @objc func orderBtnDidTap(_ sender: UIButton){//alert창 띄우기
        let alertController = UIAlertController(title: "결제 확인", message: "총 주문금액 : \(totalPrice) ₩ \n 결제하시겠습니까?", preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "네", style: .destructive) { _ in
            self.navigationController?.pushViewController(ThirdViewController(), animated: true)
        }
        let cancelAlertAction = UIAlertAction(title: "아니요", style: .default, handler: nil)
        
        alertController.addAction(okAlertAction)
        alertController.addAction(cancelAlertAction)
        present(alertController, animated: true)
    }
    
    @objc func menuBtnDidTap(_ sender: UIButton){//메뉴들 눌렀을떄 
        switch sender.currentTitle {
        case "Americano":
            totalPriceTextView.text += "\(americano.menuName) : \(americano.price)₩ \n"
            totalPrice += americano.price
        case "Latte":
            totalPriceTextView.text += "\(latte.menuName) : \(latte.price)₩ \n"
            totalPrice += latte.price
        default:
            print("error")
        }
        
    }
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
