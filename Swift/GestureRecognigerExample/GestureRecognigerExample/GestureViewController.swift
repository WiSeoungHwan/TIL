//
//  GestureViewController.swift
//  GestureRecognigerExample
//
//  Created by Wi on 01/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var isQuadruple = false
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.masksToBounds = true

    }
    @IBAction private func handleTapGesture(_ sender: UITapGestureRecognizer){
        if isQuadruple {
            imageView.transform = imageView.transform.scaledBy(x: 2, y: 2)
        }else{
            imageView.transform = CGAffineTransform.identity //
        }
        isQuadruple = !isQuadruple
        
    }
    @IBAction private func handleRotationGesture(_ sender: UIRotationGestureRecognizer){
        let rotation = sender.rotation
        imageView.transform = imageView.transform.rotated(by: rotation)
        sender.rotation = 0
    }
    @IBAction private func handleSwipeGesture(_ sender: UISwipeGestureRecognizer){
        let swipe = sender.direction
        
        
        print(sender.location(in: view))
        if imageView.frame.contains(sender.location(in: view)){
            if swipe == .right{
                print(swipe)
                imageView.image = UIImage(named: "cat2")
            }else if swipe == .left{
                print(swipe)
                imageView.image = UIImage(named: "cat1")
            }
        }
    }
    
}
