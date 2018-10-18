//
//  ViewController.swift
//  TableViewExample
//
//  Created by Wi on 18/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class ViewController01: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var data = Array(1...20)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .blue
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    @objc func reloadData(){
        //수행할 코드
        data = data.reversed()
        if tableView.refreshControl!.isRefreshing {
            tableView.refreshControl?.endRefreshing() //로딩끝내는거
            
        }
        tableView.reloadData() //데이타 다시 불러온다
    }

}
extension ViewController01: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //미리 셀을 하나 만들어 두는 것 //코드로 했을때
//        let cell = tableView.dequeueReusableCell(withIdentifier: <#T##String#>) //옵셔널 이기 떄문에 옵셔널 체크를 해야함
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)//스토리보드로 만들어 놨을때 셀이 무조건 있을때
        cell.textLabel?.text = "\(data[indexPath.row])"
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//        cell.textLabel?.text = "MyCell"
        return cell
    }
    
    
}

extension ViewController01: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath)
    }
    
}

