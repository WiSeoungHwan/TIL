//
//  VendinMachineViewController.swift
//  CustomView
//
//  Created by Wi on 17/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class VendinMachineViewController: UIViewController {

    @IBOutlet var drinkViews: [DrinkView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in drinkViews {
            i.delegate = self
        }
    }
    

}
extension VendinMachineViewController: DrinkViewDelegate{
    func increase(_ drinkView: DrinkView) {
        guard let currentNum = Int(drinkView.countLabel.text ?? "0") else { return}
        drinkView.countLabel.text = "\( currentNum + 1)"
        print("+")
    }
    func decrease(_ drinkView: DrinkView) {
        guard let currentNum = Int(drinkView.countLabel.text ?? "0") else { return}
        if currentNum > 0 {
            drinkView.countLabel.text = "\( currentNum - 1)"
        }
        print("-")
    }
}
