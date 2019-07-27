//
//  ViewController.swift
//  KakaoLoginTest
//
//  Created by Wi on 22/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction private func signInButtonDidTap(_ sender: Any){
        guard  let session = KOSession.shared() else {return}
        
        session.isOpen() ? session.close() : ()
        
        session.open (completionHandler: { (error) in
            if !session.isOpen(){
                if let error = error as NSError?{
                    switch error.code {
                    case Int(KOErrorCancelled.rawValue):
                        print("Canceled")
                    default:
                        print(error.localizedDescription)
                    }
                }
            }
            else{
                print("Login Success")
            }
        }, authTypes: [NSNumber(value: KOAuthType.talk.rawValue)])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

