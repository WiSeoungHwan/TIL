//
//  TouchViewController.swift
//  GestureRecognigerExample
//
//  Created by Wi on 01/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class TouchViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.masksToBounds = true
        
    }
    var isCatTouch = false
    var currentRect = CGPoint.zero
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("Touch Began")
        guard let touch = touches.first else {return}// 멀티터치 중에서 첫번째
        let touchPoint = touch.location(in: touch.view)//터치의 뷰를 기준으로 터치 위치 리턴
        
        if imageView.frame.contains(touchPoint){//터치를 이미지뷰의 범위 안을 했을떄
            isCatTouch = true
            imageView.image = UIImage(named: "cat2")// 사진 바꾸기
            currentRect = touchPoint
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else {return}
        let touchPoint = touch.location(in: touch.view)
        if isCatTouch{
            imageView.center.x = imageView.center.x + (touchPoint.x - currentRect.x)
            imageView.center.y = imageView.center.y + (touchPoint.y - currentRect.y)
            currentRect = touchPoint
        }
        print("Touch Moved")
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        imageView.image = UIImage(named: "cat1")
        isCatTouch = false
        print("Touch ended")
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        imageView.image = UIImage(named: "cat1")
        isCatTouch = false
        print("Touch Canceled")
    }
}
