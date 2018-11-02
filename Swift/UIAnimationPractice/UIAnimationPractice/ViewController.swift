//
//  ViewController.swift
//  UIAnimationPractice
//
//  Created by Wi on 02/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var button1 = UIButton()
    var button2 = UIButton()
    var button3 = UIButton()
    var button4 = UIButton()
    var button5 = UIButton()
    var buttons: [UIButton]  = []
    private struct UI{
        static let menuSize: CGFloat = 50
        static let distance: CGFloat = 130
        static let minScale: CGFloat = 0.2
        static let colors: [UIColor] = [.red, .green, .blue, .purple, .gray]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [button1 ,button2 ,button3 ,button4 ,button5]
        createBtn(buttons)
        view.bringSubviewToFront(button1)
    }
    
    private func createBtn(_ btns: [UIButton]){
        var count = 5
        for i in btns.reversed(){
            i.backgroundColor = UI.colors[count - 1]
            i.setTitle("버튼\(count)", for: .normal)
            i.frame = CGRect(x: 30, y: view.frame.maxY - 100, width: UI.menuSize, height: UI.menuSize)
            i.layer.cornerRadius = i.frame.width / 2
            i.addTarget(self, action: #selector(buttonDidTab), for: .touchUpInside)
            view.addSubview(i)
            count -= 1
        }
    }
    var isShowing = false
    @objc func buttonDidTab(_ sender: UIButton){
        switch sender {
        case button1:
            print("1")
            isShowing.toggle()
            var minScale: CGFloat = 0
            var distance: CGFloat = 0
            let originalFrameY = button1.center.y
            if !isShowing {
                minScale = 0
                distance = 0
                for i in buttons{
                    if i != self.button1{
                        i.frame.size = CGSize(width: minScale, height: minScale)
                    }
                    UIView.animateKeyframes(withDuration: 0.5, delay: 0.0, animations: {
                        UIView.addKeyframe(withRelativeStartTime: Double(minScale), relativeDuration: Double(minScale + UI.minScale), animations: {
                            i.frame.size = self.button1.frame.size
                            i.center.y -= distance
                            minScale += UI.minScale
                            distance += UI.distance
                        })
                    })
                    
                }
            }
            else{
                for i in buttons{
                    UIView.animateKeyframes(withDuration: 0.2, delay: 0.0, animations: {
                        UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: Double(minScale + UI.minScale), animations: {
                            i.center.y = originalFrameY
                        })
                    })
                    
                }
            }

            
            
            //usingSpringWithDamping 튕기는 느낌
            //initalSpringVelocity 가속도
            //options 애니메이션 가속 타이밍
            
            break
        case button2:
            print("2")
        case button3:
            print("3")
        case button4:
            print("4")
        case button5:
            print("5")
        default:
            break
        }
    }
}

