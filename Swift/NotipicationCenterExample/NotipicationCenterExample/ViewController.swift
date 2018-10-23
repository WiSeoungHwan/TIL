//
//  ViewController.swift
//  NotipicationCenterExample
//
//  Created by Wi on 23/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit
extension Notification.Name{
    static let sendNotification = Notification.Name(rawValue: "SEND_NOTIFICATION")
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveNotification), name: UIApplication.keyboardWillShowNotification, object: nil)
    }

    @objc func didReceiveNotification(_ sender: Notification){
        guard let userInfo = sender.userInfo,
        let keyboardFrame = userInfo[UIApplication.keyboardFrameEndUserInfoKey] as? CGRect ,
        let duration = userInfo[UIApplication.keyboardAnimationDurationUserInfoKey] as? TimeInterval,
        let curve = userInfo[UIApplication.keyboardAnimationCurveUserInfoKey] as? UInt
            else { return}
        print(keyboardFrame) //키보드 프레임
        print(duration)// 올라오는데 걸리는 시간
        print(curve) //
        
        
        
    }
    @IBAction func didEndOnExit(_ sender: Any) {
    }
}

