//
//  CollectionViewCell.swift
//  CreateCustomTabBarUseCollectionView
//
//  Created by Wi on 14/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit
//각각의 탭에 올라갈 셀의 클래스
class CustomCell: UICollectionViewCell {
    var label: UILabel = {
        let label = UILabel()
        //라벨의 세부사항 지정
        label.text = "Tab"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .lightGray // 선택되기 전에는 연한 회색
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
//    var imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.alpha = 0.5
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(label)
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addSubview(label)
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}

