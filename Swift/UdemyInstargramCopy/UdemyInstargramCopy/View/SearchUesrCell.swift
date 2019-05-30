//
//  SearchUesrCell.swift
//  UdemyInstargramCopy
//
//  Created by Wi on 26/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class SearchUesrCell: UITableViewCell {

    // MARK: - Properties
    
    var user: User? {
        didSet{
            guard let profileImageUrl = user?.profileImageUrl else { return}
            guard let username = user?.username else {return}
            guard let fullName = user?.name else {return}
            
            profileImageView.loadImage(with: profileImageUrl)
            
            self.textLabel?.text = username
            self.detailTextLabel?.text = fullName
        }
    }
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        return iv
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        // add profile image view
        addSubview(profileImageView)
        profileImageView.anchor(top: nil, left: leadingAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 48, height: 48)
        profileImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        profileImageView.layer.cornerRadius = 48 / 2
        profileImageView.clipsToBounds = true
        
        self.textLabel?.text = "Username"
        self.detailTextLabel?.text = "Full name"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textLabel?.frame = CGRect(x: 60, y: textLabel!.frame.origin.y - 2, width: (textLabel?.frame.width)!, height: (textLabel?.frame.height)!)
        textLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        
        detailTextLabel?.frame = CGRect(x: 60, y: detailTextLabel!.frame.origin.y, width: self.frame.width - 100, height: detailTextLabel!.frame.height)
        detailTextLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        detailTextLabel?.textColor = .lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
