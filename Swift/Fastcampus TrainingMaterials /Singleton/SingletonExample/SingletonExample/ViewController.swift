//
//  ViewController.swift
//  SingletonExample
//
//  Created by Wi on 10/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var phoneNumTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        pwTextField.delegate = self
        ageTextField.delegate = self
        phoneNumTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        pwTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
        phoneNumTextField.resignFirstResponder()
    }
    
    @IBAction func signUp(_ sender: Any) {
        guard let name = nameTextField.text, let pw = pwTextField.text, let age = ageTextField.text, let phoneNum = phoneNumTextField.text else {return}
        UserData.singleton.userName = name
        UserData.singleton.password = pw
        UserData.singleton.age = age
        UserData.singleton.phoneNumber = phoneNum
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

}

