//
//  ViewController.swift
//  StoryboardSegueExample
//
//  Created by Wi on 2018. 10. 2..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewLabel.text = "0"
        
        // Do any additional setup after loading the view, typically from a nib.
    }
// 다른곳에서들어올때

    @IBAction func unwindToviewController(_ unwindSegue: UIStoryboardSegue) {
        guard let sourceVC = unwindSegue.source as? SecondViewController else {
            return
        }
        viewLabel.text = "\(Int(sourceVC.SecondLabel.text!)! + 10)"
//        source 보내는 컨트롤러
//        description
    }
//다른곳으로 내보낼때
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let destination = segue.destination as? SecondViewController else{return}
        destination.data = Int(viewLabel.text!)! + 1
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
        return Int(viewLabel.text!)! < 50 ? true : false
    }
}

