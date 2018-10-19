//
//  Customell.swift
//  TableViewCellLifeCycle
//
//  Created by Wi on 19/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class Customell: UITableViewCell {
    
    override func awakeFromNib() {//스토리보드로 할때 로드 될때 호출되는 함수
        super.awakeFromNib()
        // Initialization code
        print("--------awakeFromNit")
    }
    
    override func prepareForReuse() {// 셀이 재사용 될때 호출 되는 함수
        super.prepareForReuse()
        print("--------prepareForReuse")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    deinit {
        print("--------deinit")
    }

}
