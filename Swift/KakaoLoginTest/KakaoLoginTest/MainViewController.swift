//
//  MainViewController.swift
//  KakaoLoginTest
//
//  Created by Wi on 22/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var nickName: UILabel!
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBAction private func signOutButtonDidTap(_ sender:Any){
        KOSession.shared()?.logoutAndClose(completionHandler: { (success, error) in
            if let error = error {
                return print(error.localizedDescription)
            }
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        KOSessionTask.userMeTask { [weak self](error, userMe) in
            if let error = error{
                return print(error.localizedDescription)
                
            }
            
            print(userMe)
            guard let nickname = userMe?.nickname , let profileImg = userMe?.profileImageURL, let thumbnailImg = userMe?.thumbnailImageURL else {return print("parcingErr")}
            
            
            self?.nickName.text = nickname
//            self.profileImageView.image = UIImage(data:  try! Data(contentsOf: profileImg))
//            self.thumbnailImageView.image = UIImage(data: try! Data(contentsOf: thumbnailImg))
            
            let imageLinks = [thumbnailImg,profileImg]
            for url in imageLinks{
                URLSession.shared.dataTask(with: url, completionHandler: { (data, res, error) in
                    if let error = error {
                        return print(error.localizedDescription)
                    }
                    guard let data = data, let image = UIImage(data: data) else {return}
                    
                    DispatchQueue.main.async {
                        if url == thumbnailImg{
                            self?.thumbnailImageView.image = image
                        }else{
                            self?.profileImageView.image = image
                        }
                    }
                    
                }).resume()
            }
            
            
        }
        // Do any additional setup after loading the view.
    }

}
