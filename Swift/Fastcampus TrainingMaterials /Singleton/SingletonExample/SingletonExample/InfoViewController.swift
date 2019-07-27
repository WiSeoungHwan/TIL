//
//  InfoViewController.swift
//  SingletonExample
//
//  Created by Wi on 10/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var phoneNumLabel: UILabel!
    @IBOutlet weak var pwLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let userData = UserData.singleton
        nameLabel.text = userData.userName
        pwLabel.text = userData.password
        ageLabel.text = userData.age
        phoneNumLabel.text = userData.phoneNumber
        
    }
    

   

}
