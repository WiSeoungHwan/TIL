//
//  SecondViewController.swift
//  SelectDogCatBirdOnlyCord
//
//  Created by Wi on 2018. 10. 2..
//  Copyright © 2018년 Wi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    let imageView = UIImageView()
    let countLabel = UILabel()
    let backBtn = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        createImageView()
        createLabel()
        createBtn()
    }
    func createBtn(){
        backBtn.frame = CGRect(x: 100, y: 700, width: 50, height: 50)
        backBtn.setTitle("Back", for: .normal)
        backBtn.backgroundColor = .blue
        backBtn.addTarget(self, action: #selector(btnDidTap), for: .touchUpInside)
        view.addSubview(backBtn)
    }
    @objc func btnDidTap(){
        dismiss(animated: true)
    }
    func createLabel() {
        countLabel.frame = CGRect(x: 100, y: 600, width: 50, height: 50)
        countLabel.font = UIFont.systemFont(ofSize: 30)
        countLabel.backgroundColor = .white
        view.addSubview(countLabel)
    }
    func createImageView(){
        imageView.frame = CGRect(x: 20, y: 80, width: 350, height: 400)
        view.addSubview(imageView)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
