//
//  ViewController.swift
//  WKWebViewExample
//
//  Created by Wi on 07/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "https://hanoul.kr") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    override func loadView() {
        self.view = webView
    }


}

