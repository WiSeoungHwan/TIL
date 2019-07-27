//
//  SecondViewController.swift
//  AutoLayoutLoginPageStoryboard
//
//  Created by Wi on 15/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController{
    
    @IBOutlet weak var textView: UITextView!
    var text = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = "\(text) 님 환영합니다."
    }
    
}
