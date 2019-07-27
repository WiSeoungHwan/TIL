//
//  ViewController.swift
//  ViewTransition
//
//  Created by Wi on 04/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    @IBAction func touchUpSetButton(_ sender: UIButton){
        UserInfomation.shared.name = nameField.text
        UserInfomation.shared.age = ageField.text
    }
    
    // view의 상태변화
    override func viewDidLoad() { // 뷰가 메모리에 처음 로드 되었을때 1번 실행되는 메서드
        super.viewDidLoad()
        
        print("viewDidLoad: ViewController의 view가 메모리에 로드됨")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear: ViewController의 view가 화면에 보여질 예정")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear: ViewController의 view가 화면에 보여짐")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear: ViewContoller의 view가 화면에서 사라질 예정")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear: ViewController의 view가 화면에서 사라짐")
    }
    
    // 레이아웃 상태 변화
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print("viewWillLayoutSubviews: ViewController의 view가 subview를 레이아웃 하려함")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("viewDidLayoutSubviews: ViewController의 view가 subview를 레이아웃 함")
    }

}

