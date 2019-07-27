//
//  ViewController02.swift
//  TableViewExample
//
//  Created by Wi on 18/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class ViewController02: UIViewController {
    var data = Array(0...48)
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    

}
extension ViewController02: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        var count = data.count / 10
        if (data.count % 10) != 0 {
            count += 1
        }
        return count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section != (data.count / 10){
            return 10
        }
        else {
            return data[(section * 10)...].count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "\(indexPath.section * 10 + indexPath.row)"
       
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(section)"
    }
    
}
extension ViewController02: UITableViewDelegate{
    
    
}
