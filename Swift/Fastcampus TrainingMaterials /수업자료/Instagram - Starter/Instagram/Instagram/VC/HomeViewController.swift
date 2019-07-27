//
//  ViewController.swift
//  Instagram
//
//  Created by Wi on 11/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

// 피드데이터를 보여줄 컨트롤러 입니다.
// 왼쪽 상단에 카메라 버튼이 있습니다.

class HomeViewController: UITableViewController {
    // MARK: - Properties
    
    // 피커 만들기
    let picker = UIImagePickerController()
    
    // 테이블뷰 배열
    var feedDatas = FeedManager.shared.feedDatas
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        
        // 로고 이미지 넣기
        let imageView = UIImageView(image: #imageLiteral(resourceName: "logo"))
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        
        // 카메라 버튼 올리기
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "camera"), style: .plain, target: self, action: #selector(cameraDidTap))
        
        
        // 테이블뷰 셀 등록하기
        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "feedCell")
    }
    
    
    // MARK: TableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedDatas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! FeedTableViewCell
        cell.feedData = feedDatas[indexPath.row]
        return cell
    }
    
    // MARK: Action
    
    // 카메라 버튼 올렸을때
    @objc private func cameraDidTap(){
        print("camera Tap")
        // 소스타입 카메라로 해주기
        picker.sourceType = .camera
        // 피커 띄워주기
        present(picker, animated: true)
    }
}

// MARK: - UIImagePikerController Delegate
extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    // 사진 선택이 되었을때
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 이미지 가져오기
        let image = info[.originalImage] as? UIImage
        // 피드데이터에 이미지 추가하기
        feedDatas.append(FeedData(profileImage: nil, nickname: nil, feedImage: image, comment: nil, explanation: nil))
        tableView.reloadData()
        // 피커 내려주기
        picker.dismiss(animated: true)
        print("image Selected")
    }
}
