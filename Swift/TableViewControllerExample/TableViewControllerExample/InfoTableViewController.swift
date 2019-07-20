//
//  InfoTableViewController.swift
//  TableViewControllerExample
//
//  Created by Wi on 17/07/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class InfoTableViewController: UITableViewController {
    
    let menuArr = ["앱설정", "계정 ", "개인정보", "고객 센터", "로그아웃"]
    var notificationData = [""]
    var forkData = [""]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.tableView.backgroundColor = .darkGray
        self.tableView.separatorColor = .black
        self.tableView.tableHeaderView = createTableViewHeaderView()
        tableView.contentInset = UIEdgeInsets(top: -UIScreen.main.bounds.height * 0.3, left: 0, bottom: UIScreen.main.bounds.height * 0.3, right: 0)
        
    }
    
    func createTableViewHeaderView() -> UIView{
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: UIScreen.main.bounds.height * 0.3))
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = .gray
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 2))
        footerView.backgroundColor = .black
        return footerView
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }


    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: // notificationData
            return notificationData.count
        case 1: // forkData
            return forkData.count
        case 2:
            return menuArr.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if var cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.backgroundColor = .darkGray
            cell.textLabel?.textColor = .lightGray
            return cell
        }
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.backgroundColor = .darkGray
        cell.textLabel?.textColor = .lightGray
        
        switch indexPath.section {
        case 0: // notificationData
            if indexPath.row == 0 {
                cell.textLabel?.text = "알림 설정"
                cell.imageView?.image = UIImage()
            }else{
                cell.textLabel?.text = notificationData[indexPath.row]
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 500)
            }
            
        case 1: // forkData
            if indexPath.row == 0 {
                cell.textLabel?.text = "내가 찜한 콘텐츠"
                cell.imageView?.image = UIImage()
            }else{
                cell.textLabel?.text = forkData[indexPath.row]
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 500)
            }
        case 2:
            cell.textLabel?.text = menuArr[indexPath.row]
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 500)
        default:
            break;
        }
        
        
        return cell
    }
    
    
}
