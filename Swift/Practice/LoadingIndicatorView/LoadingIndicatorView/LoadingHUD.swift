//
//  LoadingHUD.swift
//  LoadingIndicatorView
//
//  Created by Wi on 23/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//


import UIKit

class LoadingHUD: NSObject{
    private static let shared = LoadingHUD()
    private var popupView: UIImageView?
    
    class func show(){
        let popupView = UIImageView(frame: CGRect(x: 0,y: 0,width: 100,height: 100))
        popupView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        popupView.animationImages = getAnimationImageArray()
        popupView.animationDuration = 1.0
        popupView.animationRepeatCount = 0
        
        if let window = UIApplication.shared.keyWindow{
            window.addSubview(popupView)
            popupView.center = window.center
            popupView.startAnimating()
            shared.popupView?.removeFromSuperview()
            shared.popupView = popupView
        }
    }
    
    class func hide(){
        if let popupView = shared.popupView{
            popupView.stopAnimating()
            popupView.removeFromSuperview()
        }
    }
    
    private class func getAnimationImageArray() -> [UIImage]{
        var animationArray: [UIImage] = []
        var imageNum = 0
        while let image = UIImage(named: "frame-\(imageNum)") {
            animationArray.append(image)
            imageNum += 1
        }
        return animationArray
    }
}
