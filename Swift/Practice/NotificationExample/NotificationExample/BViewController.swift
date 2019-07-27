//
//  BViewController.swift
//  NotificationExample
//
//  Created by Wi on 23/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit
extension Notification.Name{
    static let sendNotification = Notification.Name(rawValue: "SEND_NOTIFICATION")
}
class BViewController: UIViewController {
    var testView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        testView.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        view.addSubview(testView)
        NotificationCenter.default.addObserver(self, selector: #selector(changeColor), name: .sendNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }
    @objc func changeColor(_ sender: Notification){
        guard let colorValue = sender.userInfo as? [String: Float] else {return}
        let r = CGFloat(colorValue["Red"] ?? 0 / 255)
        let g = CGFloat(colorValue["Green"] ?? 0 / 255)
        let b = CGFloat(colorValue["Blue"] ?? 0 / 255)
        let a = CGFloat(colorValue["A"] ?? 0)

        testView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: a)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
