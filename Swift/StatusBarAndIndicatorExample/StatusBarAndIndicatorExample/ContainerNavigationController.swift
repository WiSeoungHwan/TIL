//
//  ContainerNavigationControllerViewController.swift
//  StatusBarAndIndicatorExample
//
//  Created by Wi on 15/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class ContainerNavigationController: UINavigationController {
    
    
    override var childForStatusBarStyle: UIViewController?{
        return topViewController
    }
    override var childForStatusBarHidden: UIViewController?{
        return topViewController
    }
    override var childForHomeIndicatorAutoHidden: UIViewController?{
        return topViewController
    }

}
