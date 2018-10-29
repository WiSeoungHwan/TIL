//
//  ViewController.swift
//  HowUsePilst
//
//  Created by Wi on 29/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var data: [String: AnyObject] = [:]
    var idolArray: [[String]] = [[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plistSerialization()
        
    }
    func plistSerialization(){
        guard let path = Bundle.main.path(forResource: "idols", ofType: "plist"), let data = NSDictionary(contentsOf: URL(fileURLWithPath: path)) else {return}
        self.data = data as! [String : AnyObject]
        for i in self.data.values{
            idolArray.append(i as! Array<String>)
            
        }
        print(idolArray)
    }

}

extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let array = idolArray[section]
        return array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var array = idolArray[indexPath.section]
        cell.textLabel?.text = array[indexPath.row]
        
        return cell
    }
    
    
}
