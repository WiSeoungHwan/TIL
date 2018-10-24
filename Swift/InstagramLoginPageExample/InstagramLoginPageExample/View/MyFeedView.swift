//
//  MyFeedView.swift
//  InstagramLoginPageExample
//
//  Created by Wi on 24/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit
protocol MyFeedViewDelegate {
    func addFeedBtnDidTab()
    func logoutBtnDidTab()
}
class MyFeedView: UIView {
    var feedTable = UITableView()
    var addBtn = UIButton()
    var delegate : MyFeedViewDelegate?
    var logoutBtn = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    func configure() {
        feedTable.dataSource = self
        
        //addButton
        addBtn.setImage(UIImage(named: "Plus"), for: .normal)
        addBtn.frame = CGRect(x: 300, y: 50, width: 30, height: 30)
        addBtn.addTarget(self, action: #selector(addBtnDidTab), for: .touchUpInside)
        self.addSubview(addBtn)
        
        //feedTable
        feedTable.frame = CGRect(x: 50, y: 100, width: 200, height: 300)
        feedTable.backgroundColor = .white
        feedTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.addSubview(feedTable)
        
        //logout
        logoutBtn.frame = CGRect(x: 100, y: 450, width: 100, height: 30)
        logoutBtn.setTitle("Logout", for: .normal)
        logoutBtn.setTitleColor(.blue, for: .normal)
        logoutBtn.backgroundColor = .gray
        logoutBtn.addTarget(self, action: #selector(addBtnDidTab), for: .touchUpInside)
        self.addSubview(logoutBtn)
    }
    @objc func addBtnDidTab(_ sender: UIButton){
        switch sender {
        case addBtn:
            delegate?.addFeedBtnDidTab()
        case logoutBtn:
            delegate?.logoutBtnDidTab()
        default:
            break
        }
    }
    
}
extension MyFeedView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserInfo.singleton.feeds.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = UserInfo.singleton.feeds[indexPath.row]
        cell.textLabel?.textColor = .black
        return cell
    }
}

extension MyFeedView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {// Editing 스타일을 정해주는 코드
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {// 눌렸을때 실행되는 코드
        switch editingStyle {
        case .none:
            print("none")
            
        case .insert:
            break
            
        case .delete:
            print("deleted")
            UserInfo.singleton.remove(index: indexPath.row)
            tableView.reloadData()
        }
    }
}
