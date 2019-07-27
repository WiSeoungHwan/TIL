//
//  ListViewController.swift
//  TableViewExample
//
//  Created by Wi on 18/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    var  count = 1
    struct Route {
        static let listToVC01 = "listToVC01"
        static let listToVC02 = "listToVC02"
        static let listToVC03 = "listToVC03"

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

}
extension ListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "TableView Example 0\(count)"
        count += 1
        return cell
    }
}
extension ListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            performSegue(withIdentifier: Route.listToVC01, sender: nil)
        }else if indexPath.row == 1 {
            performSegue(withIdentifier: Route.listToVC02, sender: nil)
        }else if indexPath.row == 2{
            performSegue(withIdentifier: Route.listToVC03, sender: nil)
        }
    }
}
