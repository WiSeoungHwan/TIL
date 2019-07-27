//
//  ViewController.swift
//  VendingMachine
//
//  Created by Wi on 19/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tableView = UITableView()
    var menuNameList: [String] = ["Banana",
        "Fanta",
        "Hogadon",
        "IceTea",
        "Kloud",
        "LemonTea",
        "Santafe"]
    var menuList: [MenuView] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.frame = view.frame
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        menuList = createMenu()
        view.addSubview(tableView)
    }
    private func createMenu() -> [MenuView]{
        var list: [MenuView] = []
        for i in menuNameList{
            var menu = MenuView()
            menu.imageButton.setImage(UIImage(named: i), for: .normal)
            menu.menuLabel.text = i
            list.append(menu)
        }
        return list
        
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.addSubview(menuList[0])
        cell.addSubview(menuList[1])
        menuList[0].frame = CGRect(x: 0, y: 0, width: cell.frame.maxX / 2, height: cell.frame.size.height)
        menuList[1].frame = CGRect(x: cell.frame.maxX / 2 , y: 0, width: cell.frame.maxX / 2, height: cell.frame.size.height)
        
        
        return cell
    }
    
    
    
}



