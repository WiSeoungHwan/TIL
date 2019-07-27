//
//  CommentViewController.swift
//  Instagram
//
//  Created by Wi on 24/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self

    }
    
    func autolayout(){
        inputTextView.translatesAutoresizingMaskIntoConstraints = false
        
        self.tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        self.inputTextView.topAnchor.constraint(equalTo: self.tableView.bottomAnchor).isActive = true
        self.inputTextView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.inputTextView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.inputTextView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.inputTextView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.25).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedData?.comment?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "comment", for: indexPath) as! CommentTableViewCell
        cell.feedNickNameLabel.text = feedData?.nickName
        cell.feedImageView.image = UIImage(named: feedData?.feedImage ?? "")
        cell.feedComment.text = feedData?.comment?[indexPath.row]
        return cell
        
    }

}
