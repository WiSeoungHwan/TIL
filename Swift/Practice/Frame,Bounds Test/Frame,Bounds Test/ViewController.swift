//
//  ViewController.swift
//  Frame,Bounds Test
//
//  Created by Wi on 2018. 9. 27..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let blueView = UIView()
    let redView = UIView()
    let greenView = UIView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blueView.backgroundColor = .blue
        redView.backgroundColor = .red
        greenView.backgroundColor = .green
        
        view.addSubview(blueView)
        blueView.addSubview(redView)
        redView.addSubview(greenView)

        
        
        
        blueView.frame = CGRect(origin: CGPoint(x: 15, y: 15), size: CGSize(width: view.frame.width - 30, height: view.frame.height - 30))
        redView.frame = CGRect(origin: CGPoint(x: 15, y: 15), size: CGSize(width: blueView.frame.width - 30, height: blueView.frame.height - 30))
        greenView.frame = CGRect(origin: CGPoint(x: 15, y: 15), size: CGSize(width: redView.frame.width - 30, height: redView.frame.height - 30))

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

