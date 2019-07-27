//
//  MenuList.swift
//  VendingMachine
//
//  Created by Wi on 19/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class MenuList: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        configure()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    func configure(){
        self.delegate = self
        self.dataSource = self
    }
    
    private func AutoLayout(){
        
    }
    
}
extension MenuList: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    
}
extension MenuList: UITableViewDelegate{
    
}
