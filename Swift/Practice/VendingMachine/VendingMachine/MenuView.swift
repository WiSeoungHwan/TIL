//
//  MenuView.swift
//  VendingMachine
//
//  Created by Wi on 19/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class MenuView: UIView {
    var imageButton = UIButton()
    var menuLabel = UILabel()
    var delegate: MenuViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        autoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
        autoLayout()
    }
    
    private func configure(){
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        menuLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        imageButton.addTarget(self, action: #selector(menuBtnDidTap), for: .touchUpInside)
        
        menuLabel.textColor = .black
        menuLabel.textAlignment = .center
       
        
        self.addSubview(menuLabel)
        self.addSubview(imageButton)
    
    }
    @objc private func menuBtnDidTap(_ sender: UIButton){
        
    }
    private func autoLayout(){
        imageButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        imageButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        imageButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        imageButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        imageButton.bottomAnchor.constraint(equalTo: menuLabel.topAnchor, constant: 0).isActive = true
        
        menuLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        menuLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        menuLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
        menuLabel.topAnchor.constraint(equalTo: imageButton.bottomAnchor, constant: 0).isActive = true
        menuLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        
        
    }

}
