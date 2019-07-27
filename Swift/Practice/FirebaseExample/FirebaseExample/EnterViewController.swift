//
//  EnterViewController.swift
//  FirebaseExample
//
//  Created by Wi on 20/07/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit
import FirebaseDatabase

class EnterViewController: UIViewController {
    // MARK: - Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var enterButton: UIButton!
    
    
    var ref: DatabaseReference! // firebase database defualt ref // 처음에 전역단계에서 바로 초기화 해주면 파이어베이스 configure 되기전에 참조가 되서 앱이 죽는다.
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref = Database.database().reference() // 이쪽에서 ref 지정해주어야함
        self.attribute()
    }
    
    
    // MARK: - Method
    
    private func attribute() {
        [nameTextField, birthdayTextField, emailTextField]
            .forEach { $0?.delegate = self }
        self.nameTextField.becomeFirstResponder()
        self.enterButton.isEnabled = false
    }
    
    func nullToNil(value : Any?) -> Any? {
        if value is NSNull {
            return nil
        } else {
            return value
        }
    }
    
    private func sendData(){
        guard
            let name = nameTextField.text,
            let email = emailTextField.text
            else {return}
        let birthday = birthdayTextField.text ?? ""
        
        let userinfo = [
            "name": name,
            "email": email,
            "birthday": birthday
        ]
        
        ref.child("users")
            .queryOrdered(byChild: "email")
            .queryEqual(toValue: email).observeSingleEvent(of: .value) { [weak self] (snapshot) in
                
                // data is not nil
                if let data = self?.nullToNil(value: snapshot.value!){
                    self?.statusLabel.text = "중복된 이메일이 있습니다"
                    return
                }
                
                // data is nil
                self?.ref.child("users")
                    .childByAutoId()
                    .setValue(userinfo) { [weak self] (error, ref) in
                        // error
                        if let error = error {
                            print("ERROR: ", error.localizedDescription)
                        }
                        // success
                        self?.statusLabel.text = "*데이터가 저장되었습니다*"
                }
        }
        
    }
    
    
    // MARK: - Action
    
    @IBAction func enterButtonDidTap(_ sender: Any) {
        sendData()
    }
    

}


extension EnterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let nameTextFilled = self.nameTextField.text != ""
        let emailTextFilled = self.emailTextField.text != ""
        self.enterButton.isEnabled = nameTextFilled && emailTextFilled
    }
}
