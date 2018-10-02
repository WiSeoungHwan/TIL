//
//  SecondViewController.swift
//  SelectDogCatBridUseStoryBorad
//
//  Created by Wi on 2018. 10. 2..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var imageName = ""
    var countData = "0"
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = countData
        imageView.image = UIImage(named: imageName)
        

    }
    



}
