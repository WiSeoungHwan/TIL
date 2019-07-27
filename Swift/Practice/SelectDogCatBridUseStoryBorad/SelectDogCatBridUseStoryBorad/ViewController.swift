//
//  ViewController.swift
//  SelectDogCatBridUseStoryBorad
//
//  Created by Wi on 2018. 10. 2..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func unwindToViewController(_ unwindSegue: UIStoryboardSegue) {
        
    }
    private var count = 0
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let destination = segue.destination as? SecondViewController else{return}
        guard let button = sender as? UIButton else{return}
        count += 1
        destination.countData = String(count)
        destination.imageName = button.currentTitle ?? "0"
        
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
        
        if identifier == "Dog" || identifier == "Cat"  {
            return true
        }else if identifier == "Bird"{
            return count < 10 ?  true : false
        }else{
            return false
        }
        
    }

}

