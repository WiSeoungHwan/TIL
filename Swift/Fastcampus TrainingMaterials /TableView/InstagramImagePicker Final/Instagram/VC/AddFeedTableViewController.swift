//
//  AddFeedTableViewController.swift
//  Instagram
//
//  Created by Wi on 05/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class AddFeedTableViewController: UITableViewController {
    // HomeVC 에서 이미지를 받을 변수를 하나 만들어요.
    var image: UIImage?
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UserManager.shard.getUserInfo(completion: { [weak self] in
            user = $0
        })
    }
    
    private func configure(){
        // 테이블뷰 셀을 등록해요.
        tableView.register(UINib(nibName: "AddFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "AddFeed")
        
        // 공유버튼을 만들어요.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "공유", style: .done, target: self, action: #selector(shareBtnDidTap))
    }
    
    // 테이블뷰 필수 메서드들을 구현해줍니다.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddFeed", for: indexPath) as! AddFeedTableViewCell
        // 셀 안의 이미지 뷰에 HomeVC로 부터 받아온 이미지를 넣어줘요.
        cell.feedImageView.image = self.image
        return cell
    }
    
    // MARK: Action
    
    @objc private func shareBtnDidTap(_ sender: UIBarButtonItem){
        guard let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? AddFeedTableViewCell else {return}
        // 텍스트뷰의 텍스트를 만듭니다.
        var str =  cell.textView.text
        // 아무것도 치지 않았을떄는 비워줍니다.
        if cell.textView.text == "문구입력..."{
            str = ""
        }
        // 매니저 클래스의 데이터에 FeedData를 추가시켜요.
        FeedManager.shared.addFeedData(FeedData(profileImage: user?.profileImage , nickName: user?.userName, feedImage: image, explanation: str))
        // HomeVC로 돌아갑니다.
        navigationController?.popViewController(animated: true)
    }

}
