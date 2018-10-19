//
//  ViewController.swift
//  TableViewEditingExample
//
//  Created by Wi on 19/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let tableView = UITableView()
    private let maxCount = 20
    private lazy var data: [Int] = Array(1...maxCount)
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(switchEditingMode))
        navigationItem.title = "TableViewEditing"
        setupTableView()
        
    }

    private func setupTableView(){
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelection = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")// 셀의 아이덴티를 등록하는 작업
        view.addSubview(tableView)
        
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing..")
        refreshControl.tintColor = .blue
        refreshControl.addTarget( self, action: #selector(reloadData), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
    }
    @objc private func switchEditingMode(){
        tableView.setEditing(!tableView.isEditing, animated: true)//toggle
    }
    @objc private func reloadData(){
        var selectedNumbers: [Int] = []
        for indexPath in tableView.indexPathsForSelectedRows ?? []{
            selectedNumbers.append(data[indexPath.row])
        }
        data = selectedNumbers
        for _ in 1...(maxCount - selectedNumbers.count){
            generateRandomNumber()
        }
        if tableView.refreshControl!.isRefreshing{
            tableView.refreshControl?.endRefreshing()
        }
        tableView.reloadData()
    }
    private func generateRandomNumber(){// 재귀함수를 이용해서 중복되는 숫자가 겹치지 않게 하기
        let randomNumber = Int(arc4random_uniform(50))
        guard !data.contains(randomNumber) else{
            return generateRandomNumber()
        }
        data.append(randomNumber)
    }
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
    
    
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        guard data[indexPath.row] > 7 else {return nil}
        return indexPath
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.row % 2 == 0 ? true : false
//        return true // default
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {// Editing 스타일을 정해주는 코드
        if indexPath.row % 3 == 0{
            return .none
        }else if indexPath.row % 3 == 1{
            return .insert
        }else{
            return .delete
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {// 눌렸을때 실행되는 코드
        switch editingStyle {
        case .none:
            print("none")
            
        case .insert:
            print("inserted")
            data.insert(Int(arc4random_uniform(50)), at: indexPath.row)// 데이터 먼저 바꾸기 순서 중요
            tableView.insertRows(at: [indexPath], with: .top)
        case .delete:
            print("deleted")
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool { // editing이 없는 row 는 안나오게
        return false
    }
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return 0 // 기본 텍스트 위치 바꾸기
    }
    //ios 11.0 부터
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let addAction = UIContextualAction(style: .normal, title: "Add") { (action, view, succese) in
            print("Add")//버튼 눌렀을때 실행 함수
            succese(true)
        }
        let editAction = UIContextualAction(style: .normal, title: "Edit") { (action, view, success) in//버튼 눌렀을때 실행 함수
            print("Edit")
            success(true)
        }
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, success) in//버튼 눌렀을때 실행 함수
            print("Delete")
            success(true)
        }
        editAction.backgroundColor = .gray
        addAction.backgroundColor = .green
        let configuration = UISwipeActionsConfiguration(actions: [editAction, addAction,deleteAction])
        
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
//    //ios 8.0 부터
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let addAtrion = UITableViewRowAction(style: .default, title: "Add") { (action, indexPath) in
//            print("Add")
//        }
//        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
//            print("Delete")
//        }
//        return [addAtrion, deleteAction]
//    }
    
    
}
