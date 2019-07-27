//
//  WishListViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 19/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController {
    
    let tableView = UITableView()
    var shared = Singleton.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Wish List"
        
        navigationSet()
        configure()
        autoLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.reloadData()
    }
    
    private func navigationSet() {
        let resetBarButton = UIBarButtonItem(title: "목록 지우기", style: .done, target: self, action: #selector(navigationBarButtonAction))
        resetBarButton.tag = 0
        navigationItem.leftBarButtonItem = resetBarButton
        
        let oderBarButton = UIBarButtonItem(title: "주문", style: .done, target: self, action: #selector(navigationBarButtonAction))
        oderBarButton.tag = 1
        navigationItem.rightBarButtonItem = oderBarButton
    }
    
    @objc private func navigationBarButtonAction(_ sender: UIBarButtonItem) {
        switch sender.tag {
        case 0:
            shared.wishListDict = [:]
            tableView.reloadData()
        case 1:
            let keys = shared.wishListDict.keys.sorted()
            var temp = ""
            var sum = 0
            for key in keys {
                for category in menuDatas {
                    for product in category.products {
                        if product.name == key {
                            temp += "\(key) - \(shared.wishListDict[key]!)개 \n"
                            sum += (shared.wishListDict[key]! * product.price)
                        }
                    }
                }
            }
            temp += "결제금액 : \(sum)원"
            alertAction(tilte: "결제내역", message: temp)
        default:
            break
        }
    }
    
    func alertAction(tilte: String, message:String) {
        let alertController = UIAlertController(title: tilte, message: message, preferredStyle: .alert)
        let okAlert = UIAlertAction(title: "결제하기", style: .default) { _ in
            self.shared.wishListDict = [:]
            self.tableView.reloadData()
        }
        let cancelAlert = UIAlertAction(title: "돌아가기", style: .cancel, handler: nil)
        alertController.addAction(okAlert)
        alertController.addAction(cancelAlert)
        present(alertController, animated: true)
    }
    
    private func configure() {
        tableView.dataSource = self
        tableView.rowHeight = 100
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

extension WishListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shared.wishListDict.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let keys = shared.wishListDict.keys.sorted()
        
        let cell: UITableViewCell
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reusableCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        
        cell.imageView?.image = UIImage(named: keys[indexPath.row])
        cell.textLabel?.text = keys[indexPath.row]
        cell.detailTextLabel?.text = "주문수량 : \(shared.wishListDict[keys[indexPath.row]]!)"
        cell.selectionStyle = .none
        
        return cell
    }
}
