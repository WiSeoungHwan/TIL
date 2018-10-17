//
//  DrinkView.swift
//  CustomView
//
//  Created by Wi on 17/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit
protocol DrinkViewDelegate {
    func increase(_ drinkView: DrinkView)
    func decrease(_ drinkView: DrinkView)
}

@IBDesignable // 이 키워드가 붙은 키워드는 xib에서 작업할 수 있다 .
final class DrinkView: UIView {
    private let drinkImageView: UIImageView = UIImageView()
    private let decreaseButton: UIButton = UIButton()
    private let increaseButton: UIButton = UIButton()
    private let countLabel: UILabel = UILabel()
    
    @IBInspectable // 스토리보드에서 실시간으로 적용되는 키워드
    var image: UIImage? {
        didSet {
            drinkImageView.image = image
        }
    }
    var delegate: DrinkViewDelegate?
    override init(frame: CGRect) { // 코드로 만들었을떄 호출되는 이니셜라이즈
        super.init(frame: frame)
        
        // UI Configure
        configure()
        autoLayout()
        
    }
    required init?(coder aDecoder: NSCoder) { // 스토리보드 로 만들었을때  호출 되는 이니셜라이즈 NSCoder : xml 을 바꿔주는 것
        super.init(coder: aDecoder)
        
        //UI Configure
        configure()
        autoLayout()
    }
    private func configure(){
        //dirink ImageView
        drinkImageView.image = self.image
        drinkImageView.contentMode = .scaleAspectFit
        
        //button
        decreaseButton.setTitle("-", for: .normal)
        increaseButton.setTitle("+", for: .normal)
        decreaseButton.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        increaseButton.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)

        //label
        countLabel.text = "0"
        
        drinkImageView.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        decreaseButton.translatesAutoresizingMaskIntoConstraints = false
        increaseButton.translatesAutoresizingMaskIntoConstraints = false


        
        //addSubView
        self.addSubview(drinkImageView)
        self.addSubview(decreaseButton)
        self.addSubview(increaseButton)
        self.addSubview(countLabel)
    }
    
    
    private func autoLayout(){
        // ImageView
        drinkImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        drinkImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        drinkImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        drinkImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6)
        
        //Label
        countLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        countLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        countLabel.topAnchor.constraint(equalTo: drinkImageView.bottomAnchor, constant: 10).isActive = true
        countLabel.widthAnchor.constraint(equalTo: drinkImageView.widthAnchor, multiplier: 0.6).isActive = true
        
        // button
        decreaseButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        decreaseButton.trailingAnchor.constraint(equalTo: countLabel.leadingAnchor, constant: -10).isActive = true
        decreaseButton.heightAnchor.constraint(equalTo: countLabel.heightAnchor, multiplier: 1).isActive = true
        decreaseButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
        increaseButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        increaseButton.leadingAnchor.constraint(equalTo: countLabel.trailingAnchor, constant: 10)
        increaseButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        increaseButton.heightAnchor.constraint(equalTo: countLabel.heightAnchor, multiplier: 1).isActive = true
    }
    @objc private func buttonDidTap(_ sender: UIButton){
        switch sender {
        case increaseButton:
            self.delegate?.increase(self)
        case decreaseButton:
            self.delegate?.decrease(self)
        default:
            break
        }
    }
}
