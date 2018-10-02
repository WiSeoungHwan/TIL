//
//  ViewController.swift
//  SelectDogCatBirdOnlyCord
//
//  Created by Wi on 2018. 10. 2..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var dogBtn = UIButton()
    var catBtn = UIButton()
    var birdBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dogBtn = createButton(rect: CGRect(x: 30, y: 200, width: 50, height: 50), name: "Dog")
        catBtn = createButton(rect: CGRect(x: 130, y: 200, width: 50, height: 50), name: "Cat")
        birdBtn = createButton(rect: CGRect(x: 230, y: 200, width: 50, height: 50), name: "Bird")
        
    }
    func createButton(rect: CGRect,name: String) -> UIButton{
        let button = UIButton()
        button.frame = rect
        button.setTitle(name, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        view.addSubview(button)
        return button
        
    }
    private var count = 0
    @objc func buttonDidTap(_ sender: UIButton){
        let sc = SecondViewController()
        let btnTitle = sender.currentTitle ?? "0"
        switch sender {
        case dogBtn , catBtn:
            count += 1
            sc.imageView.image = UIImage(named: btnTitle)
            sc.countLabel.text = String(count) ?? "0"
        case birdBtn where count < 10 :
            count += 1
            sc.imageView.image = UIImage(named: btnTitle)
            sc.countLabel.text = String(count) ?? "0"
        default:
            return
        }
        present(sc, animated: true)
        
    }

}

