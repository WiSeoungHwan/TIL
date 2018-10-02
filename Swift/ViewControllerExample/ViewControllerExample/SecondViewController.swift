//
//  SecondViewController.swift
//  ViewControllerExample
//
//  Created by Wi on 2018. 10. 2..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    let countLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        createLabel()
        createbutton()
    }
    private func createLabel(){
        let labelFrame = CGRect(x: 100, y: 200, width: 100, height: 50)
        countLabel.frame = labelFrame
        countLabel.text = "0"
        view.addSubview(countLabel)
    }
    func createbutton(){
        let buttonFrame = CGRect(x: 100, y: 100, width: 100, height: 100)
        let button = UIButton(type: .system)
        button.frame = buttonFrame
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        view.addSubview(button)
    }
    @objc private func buttonDidTap(){
        guard let vc = presentingViewController as? ViewController else {return}
        vc.dataLabel.text = countLabel.text
        
        dismiss(animated: true )// same unwind
        
        
        
        
//        presentingViewController?.dismiss(animated: true)
        //presentedViewController// 자신이 프레젠트 한 것 을 보여준다.
        //presentingViewController// 나를 띄운 뷰컨트롤러를 보여준다.
//        presentingViewController?.presentedViewController// 나를 띄운 뷰컨트롤러가 띄운 컨트롤러
//        presentingViewController?.presentingViewController//
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\n ------------[SecondViewWillAppear]----------\n")
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\n ------------[SecondviewDIdAppear]----------\n")
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\n ------------[SecondviewWillDisapperar]----------\n")
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("\n ------------[SecondViewDIdDisappear]----------\n")
        
    }
    @IBAction func unwindToSecondViewController(_ unwindSegue: UIStoryboardSegue) {
    }
    deinit{
        print("\n ------------[SecondDeinit]----------\n")
    }

}
