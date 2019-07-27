//
//  SecondViewController.swift
//  StoryboardSegueExample
//
//  Created by Wi on 2018. 10. 2..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var SecondLabel: UILabel!
    
    var data = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        SecondLabel.text =  "\(data)"
        // Do any additional setup after loading the view.
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
