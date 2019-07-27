//
//  ViewController.swift
//  StatusBarAndIndicatorExample
//
//  Created by Wi on 15/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBAction func unwindToViewController(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
    }
}

