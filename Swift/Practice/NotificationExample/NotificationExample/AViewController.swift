//
//  ViewController.swift
//  NotificationExample
//
//  Created by Wi on 23/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class AViewController: UIViewController {
    
    var rSlider = UISlider()
    var rLabel = UILabel()
    var gSlider = UISlider()
    var gLabel = UILabel()
    var bSlider = UISlider()
    var bLabel = UILabel()
    var aSlider = UISlider()
    var aLabel = UILabel()
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        button.frame = CGRect(x: 100, y: 500, width: 100, height: 40)
        button.setTitle("색 조정", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonDidTab), for: .touchUpInside)
        view.addSubview(button)
        createLabel()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func buttonDidTab(_ sender: UIButton) {
        let colorValue = ["Red": rSlider.value, "Green": gSlider.value, "Blue": bSlider.value, "A":aSlider.value]
        
        NotificationCenter.default.post(name: .sendNotification, object: nil, userInfo: colorValue)
        print(colorValue)
    }
    func createLabel(){
        rSlider.frame = CGRect(x: 50, y: 100, width: 300, height: 30)
        rLabel.text = "R"
        rLabel.frame = CGRect(x: 30, y: 100, width: 300, height: 30)
        gSlider.frame = CGRect(x: 50, y: 200, width: 300, height: 30)
        gLabel.text = "G"
        gLabel.frame = CGRect(x: 30, y: 200, width: 300, height: 30)
        
        bSlider.frame = CGRect(x: 50, y: 300, width: 300, height: 30)
        bLabel.text = "B"
        bLabel.frame = CGRect(x: 30, y: 300, width: 300, height: 30)
        
        aSlider.frame = CGRect(x: 50, y: 400, width: 300, height: 30)
        aLabel.text = "A"
        aLabel.frame = CGRect(x: 30, y: 400, width: 300, height: 30)
        
        view.addSubview(rLabel)
        view.addSubview(gLabel)
        view.addSubview(bLabel)
        view.addSubview(aLabel)
        
        
        view.addSubview(rSlider)
        view.addSubview(gSlider)
        view.addSubview(bSlider)
        view.addSubview(aSlider)
    }
}

