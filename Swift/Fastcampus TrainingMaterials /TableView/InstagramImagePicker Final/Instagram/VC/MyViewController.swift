//
//  MyViewController.swift
//  Instagram
//
//  Created by Wi on 03/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit


// 마이페이지
class MyViewController: UITableViewController {
    
    let userManager = UserManager.shard
    let picker = UIImagePickerController()
    var user: User?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    override func viewWillAppear(_ animated: Bool) {
        userManager.getUserInfo { [weak self] in
            self?.user = $0
        }
        tableView.reloadData()
        self.title = user?.userName
    }
    
    
    
    // MARK: Configure
    
    func configure(){
        
        // imagePicker
        picker.delegate = self
        
        
        // noti
        NotificationCenter.default.addObserver(self, selector: #selector(nickNameChange), name: Notification.Name("nickNameChange"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(profileImageChange), name: Notification.Name("profileImageView"), object: nil)
        
        // tableView
        tableView.register(UINib(nibName: "MyViewTableViewCell", bundle: nil), forCellReuseIdentifier: "myView")
        tableView.separatorColor = .clear
        
    }
    
    // MARK: TableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 미리 만들어둔 셀
        let cell = tableView.dequeueReusableCell(withIdentifier: "myView", for: indexPath) as! MyViewTableViewCell
        cell.model = self.user
        cell.selectionStyle = .none
        
        return cell
    }
    
    // MARK: Action
    // 닉네임 수정버튼이 눌렸을때 불릴 함수
    @objc private func nickNameChange(_ sender: Notification){
        guard let nickname = sender.userInfo?["nickName"] as? String else {return}// 유저 이름 검사
        userManager.changeUserName(userName: nickname) {[weak self] (isSucc, message) in
            if isSucc{
                self?.createOkAlert(title: "변경성공", message:"변경된 닉네임: \(message)")
                return
            }
            self?.createOkAlert(title: "변경실패", message: message)
        }
        
        
    }
    // 프로필 이미지뷰를 눌렀을때 불릴 함수
    @objc private func profileImageChange(_ sender: Notification){
        createSheetAlert(title: "사진 가저오기", message: "")
    }
    
    // MARK: other func
    // 2
    private func createOkAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default){ [weak self] _ in
            self?.userManager.getUserInfo{ user in
                self?.user = user
                self?.title = user.userName
            }
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    // 1
    private func createSheetAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "카메라로 찍기", style: .default) { [weak self] _ in
            self?.picker.sourceType = .camera
            self?.present(self!.picker, animated: true)
        }
        let libraryAction = UIAlertAction(title: "앨범에서 가져오기", style: .default) {[weak self] _ in
            self?.picker.sourceType = .photoLibrary
            self?.present(self!.picker, animated: true)
        }
        let cancelAtion = UIAlertAction(title: "닫기", style: .cancel, handler: nil)
        alert.addAction(cameraAction)
        alert.addAction(libraryAction)
        alert.addAction(cancelAtion)
        present(alert, animated: true)
        
    }
}

// MARK: - UIImagePicker

extension MyViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        user?.profileImage = info[.originalImage] as? UIImage
        userManager.changeUserInfo(user: user!) {[weak self] in
            self?.user = $0
        }
        tableView.reloadData()
        picker.dismiss(animated: true, completion: nil)
    }
}
