//
//  PizzaListViewController.swift
//  DominoPizza
//
//  Created by Kira on 18/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class PizzaListViewController: CategoryViewController {

    var dataArr: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "세부 메뉴"
    }
    
    override func tableViewSetting() {
        super.tableViewSetting()
        tableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "Menu")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Menu", for: indexPath) as! MenuTableViewCell
        cell.cellImageView.image = UIImage(named: dataArr[indexPath.row])
        cell.menuNameLabel.text = dataArr[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 6
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let tablecell = tableView.cellForRow(at: indexPath), let cell = tablecell as? MenuTableViewCell else {return}
        let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        detailVC.menuName = dataArr[indexPath.row]
        show(detailVC, sender: nil)
    }
}
