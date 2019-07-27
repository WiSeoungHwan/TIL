//
//  ViewController.swift
//  Instagram
//
//  Created by Wi on 11/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Properties
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // 데이터가 바뀌면 테이블뷰를 리로드 시켜줍니다.
    var feedDataArr = [FeedData](){
        didSet{
            tableView.reloadData()
        }
    }
    
    // 이미지피커 객체를 하나 만들어줍니다.
    let picker = UIImagePickerController()
    
    
    // MARK: - Methods
    
    // MARK: life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 뷰가 나타날때 데이터를 갱신시켜요.
        feedDataArr = FeedManager.shared.returnFeedData()
    }
    
    // MARK: other func
    
    func configure(){
        // 더이상 임의로 데이터를 만들지 않을꺼라 주석처리하고 함수는 지워주었습니다.
//        createFeedData()
        
        // navigation item setting
        naviSetting()
        
        // tableViewSetting
        tableViewRegister()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .clear
        
        // addSubView
        view.addSubview(tableView)
        
        // autolayout
        autoLayout()
        
        // noti
        
        NotificationCenter.default.addObserver(self, selector: #selector(pushCommentVC), name: NSNotification.Name(rawValue: "CommentTap"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(photoSelected), name: Notification.Name("photoSelected"), object: nil)
    }
    
    func naviSetting(){
        let naviTitleView = UIImageView(image: UIImage(named: AppImageData.logo))
        naviTitleView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = naviTitleView
        self.navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(named: AppImageData.camera), style: .plain, target: self, action: #selector(cameraButtonDidTap(_:))), animated: true)
    }
    
    func tableViewRegister(){
        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "feed")
    }
    
    // MARK: Action
    
    // 카메라버튼을 눌렀을때 들어오는 함수입니다.
    @objc private func cameraButtonDidTap(_ sender: UIBarButtonItem){
        print("camera Button Tap")
        // 델리게이트와 소스타입을 지정해준뒤 화면에 띄워줍니다.
        picker.delegate = self
        picker.sourceType = .camera
        present(picker, animated: true)
    }
    @objc private func photoSelected(_ sender: Notification){
        guard let image = sender.userInfo?["image"] else {return}
        let vc = AddFeedTableViewController()
        vc.image = image as? UIImage
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func pushCommentVC(_ sender: Notification){
        print("pushComeentVC")
        guard let userInfo = sender.userInfo, let optionalCell = userInfo["cell"] , let cell = optionalCell as? UITableViewCell , let indexPath = tableView.indexPath(for: cell) else {return}
        let commentVC = CommentViewController()
        commentVC.feedData = feedDataArr[indexPath.row]
        show(commentVC, sender: nil)
    }
    
    // MARK: AutoLayout
    
    func autoLayout(){
        let guide = self.view.safeAreaLayoutGuide
        
        self.tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    }

}

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedDataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feed", for: indexPath) as! FeedTableViewCell
        cell.feedData = feedDataArr[indexPath.row]
        return cell
    }
    
}

extension HomeViewController: UITableViewDelegate{
    
}


// 이미지피커를 사용하기 위해선 아래의 두가지 델리게이트가 필요해요.
extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    // 카메라나 앨범에서 사진을 골랐을때 호출되는 함수입니다.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 만들어준 AddFeedVC를 인스턴스합니다.
        let vc = AddFeedTableViewController()
        // vc의 이미지 변수에 내가 선택한 사진을 가져와서 넣어줘요.
        vc.image = info[.originalImage] as? UIImage
        // 푸시하기
        navigationController?.pushViewController(vc, animated: true)
        // picker 닫아주기
        picker.dismiss(animated: true, completion: nil)
        
    }
    
}
