//
//  ViewController.swift
//  FirebaseTest
//
//  Created by Wi on 2018. 10. 3..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    var databaseRefer : DatabaseReference!
    var databaseHandle : DatabaseHandle!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create Record into Firebase
        databaseRefer = Database.database().reference()
        databaseRefer.child("name").childByAutoId().setValue("Visal")
        databaseRefer.child("name").childByAutoId().setValue("Phanith")
//        databaseRefer.child("name/0").childByAutoId().setValue("sh")
        
        // Read Data From Firebase
        databaseHandle = databaseRefer.child("name").observe(.childAdded, with: {(data) in
            let name : String = (data.value as? String)!
            debugPrint(name)
        })
        
        
    }


}

