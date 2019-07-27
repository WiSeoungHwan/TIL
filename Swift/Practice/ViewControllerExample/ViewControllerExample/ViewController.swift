//
//  ViewController.swift
//  ViewControllerExample
//
//  Created by Wi on 2018. 10. 2..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let firstBtn = UIButton()
    let secondBtn = UIButton()
    let dataLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\n ------------[viewDidLoad]----------\n")
        createButton(rect: CGRect(x: 100, y: 100, width: 100, height: 100), button: firstBtn,name: "First")
        createButton(rect: CGRect(x: 300, y: 100, width: 100, height: 100), button: secondBtn,name: "Second")
        createLabel(rect: CGRect(x: 200, y: 300, width: 200, height: 200), label: dataLabel)
    }
    func createLabel(rect: CGRect,label: UILabel) {
        let labelFrame = rect
        label.frame = labelFrame
        label.font = UIFont.systemFont(ofSize: 40)
        label.text = "Label"
        view.addSubview(label)
    }
    func createButton(rect: CGRect,button: UIButton,name: String){
        let buttonFrame = rect
        button.frame = buttonFrame
        button.setTitle(name, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        view.addSubview(button)
    }
    @objc func buttonDidTap(_ sender: UIButton){
        let secondViewController = SecondViewController()
        present(secondViewController, animated: true)
        switch sender {
        case firstBtn:
            secondViewController.countLabel.text = "First"
        case secondBtn:
            secondViewController.countLabel.text =  "Second"
        default:
            return
        }
        
       
        
        
//        present(secondViewController,animated: true){
//          viewDidAppear 때 호출 되는 부분
//        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\n ------------[ViewWillAppear]----------\n")

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\n ------------[viewDIdAppear]----------\n")

    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\n ------------[viewWillDisapperar]----------\n")

    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("\n ------------[ViewDIdDisappear]----------\n")

    }
    
    deinit{
        print("\n ------------[Deinit]----------\n")
    }
    @IBAction func unwindToViewController(_ unwindSegue: UIStoryboardSegue) {
        
    }
    
}

