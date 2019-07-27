//
//  SecondViewController.swift
//  ViewTransition
//
//  Created by Wi on 04/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    
    // view의 상태변화
    override func viewDidLoad() { // 뷰가 메모리에 처음 로드 되었을때 1번 실행되는 메서드
        super.viewDidLoad()
        
        print("viewDidLoad: SecondViewController의 view가 메모리에 로드됨")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.nameLabel.text = UserInfomation.shared.name
        self.ageLabel.text = UserInfomation.shared.age
        
        print("viewWillAppear: SecondViewController의 view가 화면에 보여질 예정")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear: SecondViewController의 view가 화면에 보여짐")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear: SecondViewContoller의 view가 화면에서 사라질 예정")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear: SecondViewController의 view가 화면에서 사라짐")
    }
    
    // 레이아웃 상태 변화
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print("viewWillLayoutSubviews: SecondViewController의 view가 subview를 레이아웃 하려함")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("viewDidLayoutSubviews: SecondViewController의 view가 subview를 레이아웃 함")
    }
    @IBAction func popToPrev(){
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func dismissModal(){
        self.dismiss(animated: true, completion: nil)
    }
}
