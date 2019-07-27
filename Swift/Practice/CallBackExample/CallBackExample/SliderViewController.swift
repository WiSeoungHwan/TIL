//
//  SliderViewController.swift
//  CallBackExample
//
//  Created by Wi on 24/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var callBack: ((UIColor) -> Void)? //escaping
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func tap(_ sender: UIButton) {
        let color =  UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        callBack?(color)
    }
    
    

}
