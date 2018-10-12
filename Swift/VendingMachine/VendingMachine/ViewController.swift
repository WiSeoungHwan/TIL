//
//  ViewController.swift
//  위성환(자판기 구현)
//
//  Created by Wi on 2018. 10. 8..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentCash = 0
    var result = ""
    var coke = UIButton()
    var cider = UIButton()
    var coffee = UIButton()
    var water = UIButton()
    var add1000₩ = UIButton()
    var add500₩ = UIButton()
    var textView = UITextView()
    var returnCash = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        coke = createMenu(menu: Menu(name: "coke", price: 1000), rect: CGRect(x: 30, y: 50, width: 100, height: 150))
        cider = createMenu(menu: Menu(name: "cider", price: 800), rect: CGRect(x: 200, y: 50, width: 100, height: 150))
        coffee = createMenu(menu: Menu(name: "coffee", price: 1500), rect: CGRect(x: 30, y: 300, width: 100, height: 150))
        water = createMenu(menu: Menu(name: "water", price: 500), rect: CGRect(x: 200, y: 300, width: 100, height: 150))
        add1000₩ = createMoneyBtn(name: "1000원", rect: CGRect(x: 50, y: 700, width: 100, height: 50))
        add500₩ = createMoneyBtn(name: "500원", rect: CGRect(x: 200, y: 700, width: 100, height: 50))
        returnCash = createMoneyBtn(name: "반환", rect: CGRect(x: 300, y: 700, width: 70, height: 50))
        textView = createTextView()
    }
    func createMoneyBtn(name: String, rect: CGRect) -> UIButton {
        let btn = UIButton(frame: rect )
        btn.setTitle(name, for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.setTitleColor( .red, for: .selected)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        btn.addTarget(self, action: #selector(menuDidTap(_:)), for: .touchUpInside)
        view.addSubview(btn)
        return btn
    }
    func createTextView() -> UITextView{
        let textView = UITextView(frame: CGRect(x: 30, y: 600, width: 300, height: 100))
        textView.backgroundColor = .black
        textView.textColor = .white
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.text = " \(result) \n 잔액 : \(currentCash)원"
        view.addSubview(textView)
        return textView
    }
    func createMenu(menu: Menu, rect: CGRect) -> UIButton{
        let button = UIButton(frame: rect)
        let label = UILabel(frame: CGRect(x: rect.origin.x, y: rect.origin.y + 160, width: 60, height: 30))
        label.text = "\(menu.price) 원"
        label.textColor = .black
        label.textAlignment = .right
        button.setBackgroundImage(UIImage(named: menu.name), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(menuDidTap(_:)), for: .touchUpInside)
        view.addSubview(label)
        view.addSubview(button)
        return button
    }
    @objc func menuDidTap(_ sender: UIButton){
        switch sender {
        case coke:
            if currentCash >= 1000 {
                result = "콜라가 나왔습니다."
                currentCash -= 1000
            }else{
                result = "잔액이 부족합니다."
            }
            
        case coffee:
            if currentCash >= 1500{
                result = "커피가 나왔습니다."
                currentCash -= 1500
            }else{
                result = "잔액이 부족합니다."
            }
        case cider:
            if currentCash >= 800{
                result = "사이다가 나왔습니다."
                currentCash -= 800
            }else{
                result = "잔액이 부족합니다."
            }
            
        case water:
            if currentCash >= 500{
                result = "물이 나왔습니다."
                currentCash -= 500
            }else{
                result = "잔액이 부족합니다."
            }
        case add500₩:
            currentCash += 500
            result = "500원이 입금되었습니다."
        case add1000₩:
            currentCash += 1000
            result = "1000원이 입금되었습니다."
        case returnCash:
            if currentCash == 0{
                result = "반환될 금액이 없습니다."
            }else{
                result = "\(currentCash)원이  반환되었습니다."
                currentCash = 0
            }
            
            
        default:
            break
            }
        textView.text = " \(result) \n 잔액 : \(currentCash)원"
        print(currentCash)
        
    }
    
}

