//
//  WishListViewController.swift
//  DominoPizza
//
//  Created by Kira on 18/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: - Properties
    var dataArr = WishListClass.singleton.dataSetting()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    // MARK: - Methods
    
    // MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Wish List"
        configure()
        naviSetting()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataArr = WishListClass.singleton.dataSetting()
        tableView.reloadData()
    }
    
    
    // MARK: tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Wish", for: indexPath) as! WishListTableViewCell
        cell.menuImage = dataArr[indexPath.row].name
        cell.number = "주문수량: \(dataArr[indexPath.row].number) 개"
        cell.menuName = dataArr[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 6
    }
    
    // MARK: otherFunc
    
    
    func configure(){
        dataArr = WishListClass.singleton.dataSetting()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        autolayout()
        tableView.separatorColor = .clear
        tableView.register(UINib(nibName: "WishListTableViewCell", bundle: nil), forCellReuseIdentifier: "Wish")
        self.tabBarItem.title = self.title
    }
    
    func naviSetting() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "주문", style: .done, target: self, action: #selector(orderButtonDidTap(_:)))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "목록지우기", style: .plain, target: self, action: #selector(clearList(_:)))
    }
    
    // MARK: Action
    
    @objc func clearList(_ sender: UIBarButtonItem){
        WishListClass.singleton.wishList = [:]
        dataArr = WishListClass.singleton.dataSetting()
        tableView.reloadData()
    }
    
    @objc func orderButtonDidTap(_ sender: UIBarButtonItem){
        var list = WishListClass.singleton.returnWishListString().isEmpty ? "메뉴를 추가해주세요" : WishListClass.singleton.returnWishListString()
        let alert = UIAlertController(title: "주문하기", message: list  , preferredStyle: .alert)
        let cancelAtcion = UIAlertAction(title: "돌아가기", style: .default, handler: nil)
        let orderAtcion = UIAlertAction(title: "주문하기", style: .destructive) { [weak self]_ in
            WishListClass.singleton.wishList = [:]
            self?.dataArr = WishListClass.singleton.dataSetting()
            self?.tableView.reloadData()
        }
        
        alert.addAction(cancelAtcion)
        alert.addAction(orderAtcion)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: autolayout
extension WishListViewController{
    func autolayout(){
        let guide = self.view.safeAreaLayoutGuide
        tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        
    }
}
