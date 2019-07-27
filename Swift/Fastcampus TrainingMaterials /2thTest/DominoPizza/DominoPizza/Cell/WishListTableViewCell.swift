//
//  WishListTableViewCell.swift
//  DominoPizza
//
//  Created by Wi on 22/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class WishListTableViewCell: UITableViewCell {
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var menuImage = "" {
        didSet{
            menuImageView.image = UIImage(named: self.menuImage)
        }
    }
    var menuName = ""{
        didSet{
            menuLabel.text = self.menuName
        }
    }
    var number = "" {
        didSet {
            numberLabel.text = self.number
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
