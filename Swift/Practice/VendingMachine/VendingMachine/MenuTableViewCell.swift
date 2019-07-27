//
//  MenuTableViewCell.swift
//  VendingMachine
//
//  Created by Wi on 19/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    var leftMenu = MenuView()
    var rightMenu = MenuView()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(leftMenu)
        self.addSubview(rightMenu)
    }
    
    private func autoLayout(){
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
