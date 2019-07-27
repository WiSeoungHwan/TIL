//
//  ViewController.swift
//  AlertControllerExample
//
//  Created by Wi on 2018. 9. 27..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    var num = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        number.text = String(num)
        actionButton.layer.cornerRadius = CGFloat(20)
    }
    @IBAction func plusButtonDidTap(_ sender: UIButton) {
        let alertController = UIAlertController(title: "add num?", message: nil, preferredStyle: UIAlertControllerStyle.alert)

        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            if let value = Int(alertController.textFields![0].text!){
                self.num += value
                self.number.text = String(self.num)
            }else{
                self.num = self.num + 1
                self.number.text = String(self.num)
                
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let resetAction = UIAlertAction(title: "Reset", style: .destructive) { (resetAction) in
            self.num = 0
            self.number.text = String(self.num)
        }

        
        alertController.addTextField()
        alertController.addAction(addAction)
        alertController.addAction(resetAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
        
    }
    @IBAction func buttonDidTap(_ sender: UIButton) {
        let alertController = UIAlertController (title: "타이틀", message: "메세지", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        let voidAction = UIAlertAction(title: "Void", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(voidAction)
        alertController.addAction(cancelAction)
        
        present(alertController,animated: true)
        
        
    }
    @IBAction func scondButtonDIdTap(_ sender: UIButton) {
        let alertController = UIAlertController (title: "두번쨰", message: "버튼", preferredStyle: UIAlertControllerStyle.actionSheet)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let voidAction = UIAlertAction(title: "Void", style: .destructive, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(voidAction)
        alertController.addAction(cancelAction)
        
        present(alertController,animated: true)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

