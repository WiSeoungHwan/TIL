//
//  ViewController.swift
//  CallBackExample
//
//  Created by Wi on 24/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //선언
    var dictionary: [String: Any] = [:]
    
    

    @IBOutlet weak var colorView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        dictionary = ["key": "value", "stringArray": ["value","value2"] , "intArray":[0,1,2,3,], "Dictionary": ["key": "value"]]
        dictionary = ["dic1":["dic2":["dic3":["dic4":"value"]]]]
        dictionary["NewKey"] = nil
        dictionary.removeValue(forKey: "NewKey")
        dictionary.updateValue("수정될 내용 ", forKey: "해당 키")
        print(dictionary)
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextViewController = segue.destination as! SliderViewController
        nextViewController.callBack = {  (color: UIColor) -> Void in
            self.colorView.backgroundColor = color
        }
        
    }
}

