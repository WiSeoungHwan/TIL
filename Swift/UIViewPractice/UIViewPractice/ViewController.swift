//
//  ViewController.swift
//  UIViewPractice
//
//  Created by Wi on 13/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // 테이블 뷰의 에디팅 버튼이 눌렸을때 실행될 부분
        // 델리게이트에서 따로 구현하지 않을시에 기본 에디팅 버튼이 나온다.
        switch editingStyle {
        case .none:
            print("none Tap")
            break
        case .insert:
            print("insert Tap")
            break
        case .delete:
            print("delete Tap")
            break
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //section의 개수
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8 // section 당 셀의 개수
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //섹션의 위쪽 타이틀
        return "HeaderTitle"
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        //섹션의 밑쪽 타이틀
        return "FooterTitle"
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) // 스토리보드에서 등록해 두었다면 등록해둔 cell 의 identifier 등록하지 않았다면 코드로 따로 구현
        cell.textLabel?.text = "Hello World"
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate{
    // 각 셀의 height값
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//    //행의 들여쓰기 수준
//    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
//        return 1
//    }
    // 특정행에 대해 셀을 그리려고 할때 호출되는 함수
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//
//    }
    // editAction버튼을 추가하는 함수
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //타입은 세가지가 있고 각각 눌렸을때 반응을 클로져로 처리 가능하다
        let defaultRowAction = UITableViewRowAction(style: .default, title: "default") { (self, indexPath) in
            print("default Tap")
        }
        //커스터마이징도 가능
        defaultRowAction.backgroundColor = .green
        let normalRowAction = UITableViewRowAction(style: .normal, title: "normal") { (self, indexPath) in
            print("normal Tap")
        }
        let destructiveRowAction = UITableViewRowAction(style: .destructive, title: "destructive") { (self, indexPath) in
            print("destructive Tap")
        }
        //버튼들을 배열로 반환
        return [defaultRowAction,normalRowAction,destructiveRowAction]
    }
    
    //왼쪽으로 스와이프 했을때 작동하는 함수 
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextualAction = UIContextualAction(style: .destructive, title: "sdf") { (action, view, completion) in
            action.title = "🌈"
            completion(false) // 끝까지 스와이프 했을때 삭제되는 모션 활성화 여부
        }
        let leadingSwipeAction = UISwipeActionsConfiguration(actions: [contextualAction])
        return leadingSwipeAction
    }
}

