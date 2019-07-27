//
//  DetailViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 19/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let imageView = UIImageView()
    let tempView = UIView()
    let minusButton = UIButton()
    let displayLabel = UILabel()
    let plusButton = UIButton()
    
    var productName = "" {
        didSet {
            navigationItem.title = productName
        }
    }
    var selectCount: Int = 0 {
        didSet {
            displayLabel.text = "\(selectCount) 개"
        }
    }
    
    var shared = Singleton.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configure()
        autoLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        guard let value = shared.wishListDict[productName] else {selectCount = 0; return}
        selectCount = value
    }
    
    private func configure() {
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .black
        view.addSubview(imageView)
        
        view.addSubview(tempView)
        
        minusButton.tag = 0
        minusButton.setTitle("-", for: .normal)
        minusButton.setTitleColor(.black, for: .normal)
        minusButton.layer.borderWidth = 3
        minusButton.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        minusButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        tempView.addSubview(minusButton)
        
        displayLabel.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        displayLabel.text = "0 개"
        displayLabel.textAlignment = .center
        displayLabel.textColor = .white
        tempView.addSubview(displayLabel)
        
        plusButton.tag = 1
        plusButton.setTitle("+", for: .normal)
        plusButton.setTitleColor(.black, for: .normal)
        plusButton.layer.borderWidth = 3
        plusButton.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        plusButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        tempView.addSubview(plusButton)
    }
    
    private func autoLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        tempView.translatesAutoresizingMaskIntoConstraints = false
        tempView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        tempView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        
        tempView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        tempView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.topAnchor.constraint(equalTo: tempView.topAnchor).isActive = true
        minusButton.leadingAnchor.constraint(equalTo: tempView.leadingAnchor).isActive = true
        minusButton.bottomAnchor.constraint(equalTo: tempView.bottomAnchor).isActive = true
        minusButton.widthAnchor.constraint(equalTo: tempView.widthAnchor, multiplier: 0.2).isActive = true
        
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        displayLabel.topAnchor.constraint(equalTo: tempView.topAnchor).isActive = true
        displayLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor).isActive = true
        displayLabel.bottomAnchor.constraint(equalTo: tempView.bottomAnchor).isActive = true
        displayLabel.widthAnchor.constraint(equalTo: tempView.widthAnchor, multiplier: 0.6).isActive = true
        
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.topAnchor.constraint(equalTo: tempView.topAnchor).isActive = true
        plusButton.leadingAnchor.constraint(equalTo: displayLabel.trailingAnchor).isActive = true
        plusButton.trailingAnchor.constraint(equalTo: tempView.trailingAnchor).isActive = true
        plusButton.bottomAnchor.constraint(equalTo: tempView.bottomAnchor).isActive = true
        plusButton.widthAnchor.constraint(equalTo: tempView.widthAnchor, multiplier: 0.2).isActive = true
    }
    
    @objc private func buttonAction(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            guard selectCount > 0 else {return}
            selectCount -= 1
        case 1:
            selectCount += 1
        default:
            break
        }
        shared.wishListDict[productName] = selectCount
    }
}
