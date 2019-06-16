//
//  TestCell.swift
//  MusicAppExample
//
//  Created by Wi on 16/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit
import FoldingCell

class TestCell: FoldingCell {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func animationDuration(_ itemIndex: NSInteger, type: FoldingCell.AnimationType) -> TimeInterval {
        let duration = [0.5,0.5,0.3]
        return duration[itemIndex]
    }
    
}
