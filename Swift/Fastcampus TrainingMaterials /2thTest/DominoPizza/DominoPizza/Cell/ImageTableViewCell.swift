//
//  ImageTableViewCell.swift
//  DominoPizza
//
//  Created by Wi on 21/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    @IBOutlet weak var cellImageView: UIImageView!
    
    var cellImage: UIImage?{
        didSet{
            self.cellImageView.image = self.cellImage
        }
    }
    var cellType: String?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
