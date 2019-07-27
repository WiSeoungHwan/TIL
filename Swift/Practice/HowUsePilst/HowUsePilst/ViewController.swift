//
//  ViewController.swift
//  HowUsePilst
//
//  Created by Wi on 29/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var data: [String: [String]] = [:]
    var idolArray: [[String]] = [[]]
    var keysArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plistSerialization()
        
    }
    func plistSerialization(){
        guard let path = Bundle.main.path(forResource: "idols", ofType: "plist"), let data = NSDictionary(contentsOf: URL(fileURLWithPath: path)) else {return}
        self.data = data as! [String : [String]]
        for i in self.data.keys{
            keysArray.append(i)
        }
        print(keysArray)
    }

}

extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let array = keysArray[section]
        return array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.data[keysArray[indexPath.section]]![indexPath.row]
        
        return cell
    }
    
    
}
