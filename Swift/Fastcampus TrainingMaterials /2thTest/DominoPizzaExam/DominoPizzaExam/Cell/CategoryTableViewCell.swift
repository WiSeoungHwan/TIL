//
//  CategoryTableViewCell.swift
//  DominoPizzaExam
//
//  Created by Kira on 19/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    let categoryImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        autoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.addSubview(categoryImageView)
    }
    
    private struct Standard {
        static let space: CGFloat = 10
    }
    
    private func autoLayout() {
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        categoryImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        categoryImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        categoryImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        categoryImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
}
