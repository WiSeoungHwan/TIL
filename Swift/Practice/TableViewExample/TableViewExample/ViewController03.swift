//
//  ViewController03.swift
//  TableViewExample
//
//  Created by Wi on 18/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class ViewController03: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
extension ViewController03: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .checkmark
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // 섹션안에 몇개의 셀이 들어가는지
        return 10
    }
}

extension ViewController03: UITableViewDelegate{
    
}
