//
//  ViewController.swift
//  2thTestAutoLayout
//
//  Created by Wi on 19/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: IBOutlet
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var firstLabel: UILabel!
    
    // MARK: other properties
    var topConstraints: NSLayoutConstraint?
    
    
    // 코드로 구현 부분
    let skyBlueView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor =  #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        return view
    }()
    
    let navyBlueView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
       return view
    }()
    
    let label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "네번째 문제"
        label.font = UIFont.systemFont(ofSize: 23)
        label.backgroundColor = .white
        return label
    }()
    
    
    // MARK: - Methods
    
    // MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        codeConfigure()
        
        // 스토리보드 구현 부분
        topConstraints = topConstraint
        NotificationCenter.default.addObserver(self, selector: #selector(orientationDidChange), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    // MARK: code
    
    func codeConfigure(){
        // addSubview
        view.addSubview(skyBlueView)
        view.addSubview(navyBlueView)
        view.addSubview(label)
        
        
        // skyBlueView
        skyBlueView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        skyBlueView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        skyBlueView.topAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        skyBlueView.leadingAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        // navyBlueView
        navyBlueView.centerYAnchor.constraint(equalTo: skyBlueView.centerYAnchor).isActive = true
        navyBlueView.centerXAnchor.constraint(equalTo: skyBlueView.centerXAnchor).isActive = true
        navyBlueView.widthAnchor.constraint(equalTo: skyBlueView.widthAnchor, multiplier: 0.5).isActive = true
        navyBlueView.heightAnchor.constraint(equalTo: skyBlueView.heightAnchor, multiplier: 0.5).isActive = true
        
        // label
        label.centerYAnchor.constraint(equalTo: navyBlueView.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: navyBlueView.centerXAnchor, constant: 20).isActive = true
        
        
        
        
        
    }
  
    
    // MARK: Action
    
    @objc private func orientationDidChange(_ sender: Notification){
        let isPortrait = UIDevice.current.orientation.isPortrait
        topConstraints?.isActive = isPortrait
        
    }
    
    


}

