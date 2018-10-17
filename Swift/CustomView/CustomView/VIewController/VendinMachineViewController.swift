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
        print("+")
    }
    func decrease(_ drinkView: DrinkView) {
        print("-")
    }
}
