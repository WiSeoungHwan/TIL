//
//  ViewController.swift
//  ButtonAnimationExmaple
//
//  Created by Wi on 02/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct Time {
        static let short = 0.3
        static let middle = 0.65
        static let long = 1.0
    }
    private struct UI{
        static let menuCount = 5
        static let menuSize: CGFloat = 50
        static let distance: CGFloat = 130
        static let minScale: CGFloat = 0.2
        static let colors: [UIColor] = [.red, .green, .blue, .purple, .gray]
    }
    private var firstMenuContainer: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFirstMenus()
        
    }
    private func setupFirstMenus(){
        for i in (0 ..< UI.menuCount){
            let menuFrame = CGRect(x: 50, y: view.bounds.height - 110, width: UI.menuSize, height: UI.menuSize)
            let button = makeMenuButtonWith(frame: menuFrame , title : "버튼\(i + 1)")
            firstMenuContainer.append(button)
            
            if i == 0 {
                button.transform = .identity
                button.addTarget(self, action: #selector(firstMenuDidTap), for: .touchUpInside)
            }
            
        }
        view.bringSubviewToFront(firstMenuContainer.first!)
        
    }
    @objc func firstMenuDidTap(_ sender: UIButton){
        sender.isSelected.toggle()
        
        UIView.animate(withDuration: Time.middle, //몇초안에 재생을 완료할 것인지 
                       delay: 0,
                       usingSpringWithDamping: 0.8, // 튕기는 느낌
                       initialSpringVelocity: 0, //튕김 가속도
                       options: [.curveEaseIn], // 애니메이션 속도커브
                       animations: { // 애니메이션
            for (idx,menu) in self.firstMenuContainer.enumerated(){ // 튜플로 idx랑 배열값 동시에 받아오기
                guard idx != 0 else {continue}
                if sender.isSelected{
                    menu.transform = .identity
                    menu.frame.origin.y -= UI.distance * CGFloat(idx)
                }else{
                    menu.transform = menu.transform.scaledBy(x: UI.minScale, y: UI.minScale)
                    menu.frame.origin.y += UI.distance * CGFloat(idx)
                }
            }
        })
    }
    
    /// makeButton
    ///
    /// - Parameters:
    ///   - frame: buttonFrame
    ///   - title: buttonTitle
    /// - Returns: return button
    private func makeMenuButtonWith(frame: CGRect , title: String) -> UIButton{
        let button = UIButton(frame: frame)
        button.backgroundColor = randomColorGenerator()
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = button.bounds.width / 2
        button.transform = button.transform.scaledBy(x: UI.minScale, y: UI.minScale)
        view.addSubview(button)
        return button
    }
    // 랜덤 색깔 반환 함수
    private func randomColorGenerator() -> UIColor{
        let red = CGFloat.random(in: 0 ... 1.0)
        let green = CGFloat.random(in: 0 ... 1.0)
        let blue = CGFloat.random(in: 0 ... 1.0)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

