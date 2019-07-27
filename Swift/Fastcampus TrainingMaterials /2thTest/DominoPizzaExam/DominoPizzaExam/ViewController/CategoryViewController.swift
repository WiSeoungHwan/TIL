//
//  ViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 19/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    let headerView = UIImageView()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Domino's"
        
        configure()
        autoLayout()
    }
    
    private func configure() {
        headerView.image = UIImage(named: "logo")
        headerView.contentMode = .scaleAspectFit
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        headerView.backgroundColor = .white
        tableView.tableHeaderView = headerView
        tableView.rowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "categoryCell")
        view.addSubview(tableView)
    }
    
    private func autoLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as? CategoryTableViewCell else {return UITableViewCell()}
        
        cell.categoryImageView.image = UIImage(named: menuDatas[indexPath.row].category)
        cell.selectionStyle = .none
        
        return cell
    }
}


extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productListVC = ProductListViewController()
        productListVC.products = menuDatas[indexPath.row].products
        productListVC.title = menuDatas[indexPath.row].category
        show(productListVC, sender: nil)
    }
}
