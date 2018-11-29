//
//  ViewController.swift
//  LocalNotification
//
//  Created by Wi on 29/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calinderButton: UIButton!
    @IBOutlet weak var timeIntervalButton: UIButton!
    
    let noti = UNNotificationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func timeButton(_ sender: Any) {
    noti.triggerTimeIntervalNotification()
    }
    @IBAction func calinderButton(_ sender: Any) {
    noti.triggerCalinderNotification()
    }
    
}

