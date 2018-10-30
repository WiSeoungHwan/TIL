//
//  ViewController.swift
//  URLScheme
//
//  Created by giftbot on 2018. 7. 2..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit
//URL 스킴을 이용해서 다른 앱으로 넘어가는 함수
final class ViewController: UIViewController {
  //setting 화면으로 이동하는 함수
  @IBAction private func openSetting(_ sender: Any) {
    print("\n---------- [ openSettingApp ] ----------\n")
    guard let settingURL  = URL(string: UIApplicationOpenSettingsURLString) , UIApplication.shared.canOpenURL(settingURL) else {return}
    if #available(iOS 10.0, *){
        UIApplication.shared.open(settingURL)
        
        UIApplication.shared.open(settingURL, options: [UIApplicationOpenURLOptionUniversalLinksOnly: false]) { (success) in
            print("isOpenSuccess:", success)
        }
    }else{
        UIApplication.shared.openURL(settingURL)
    }
    
  }
  
  @IBAction private func openMail(_ sender: Any) {
    print("\n---------- [ openMail ] ----------\n")
    let mailURL = URL(string: "mailto://")! // 메일 주소를 처음부터 입력 가능
    //메일은 시물레이터에서 안됨
    if UIApplication.shared.canOpenURL(mailURL){// canOpenURL 열수 있는 URL 인지
        UIApplication.shared.open(mailURL)// 열기
    }
    
  }

  @IBAction private func openMessage(_ sender: Any) {
    print("\n---------- [ openMessage ] ----------\n")
//    let messageURL = URL(string: "sms:")
    let messageURL = URL(string: "sms://010-0000-0000")!
    if UIApplication.shared.canOpenURL(messageURL){
        UIApplication.shared.open(messageURL)
    }
    
  }
  //website로 이동
  @IBAction private func openWebsite(_ sender: Any) {
    print("\n---------- [ openWebsite ] ----------\n")
    let websiteURL = URL(string: "https://google.com")! // 원하는 주소로 바로 보낼 수 있다.
    if UIApplication.shared.canOpenURL(websiteURL){
        UIApplication.shared.open(websiteURL)
    }
    
  }
  

  @IBAction private func openFacebook(_ sender: Any) {
    print("\n---------- [ openFacebook ] ----------\n")
    let facebookURL = URL(string: "fb://")!
    if UIApplication.shared.canOpenURL(facebookURL){//canOpenURL 안쓰면 열림 쓰면 안열림
        // 3rdParty 앱에 대해서는  화이트 리스트 등록 필요 ios 9.0부터 기본앱을 제외한 앱에 대해 화이트 리스트 미등록시 canOpenURl false 반환
        //화이트 리스트 등록 하는 방법
//        info.plist 에서
//        sorceCode로 열어서 dict 밑에 붙여넣기
//        <key>LSApplicationQueriesSchemes</key>
//        <array>
//        <string>fb</string>
//        </array>
        UIApplication.shared.open(facebookURL)
    }
    print(UIApplication.shared.canOpenURL(facebookURL))
  }
    
  // 내가 만든 앱 열기
    //새로만든 앱에서 info 에서 urlType 추가 하기
    
    //scheme으로 추가 할시 이름이 겹치게 되면 다른 앱이 열릴 수 있다.
    
  @IBAction private func openMyApp(_ sender: Any) {
    print("\n---------- [ openMyApp ] ----------\n")
    let myAppURL = URL(string: "myApp://?name=abc&age=10")!
    if UIApplication.shared.canOpenURL(myAppURL){
        UIApplication.shared.open(myAppURL)
    }
  }
}


//[ 참고 Scheme ]
//전화 - tel://010-1234-5678"
//페이스타임 - facetime://010-1234-5678"
//애플맵 검색 텍스트 - http://maps.apple.com/?q=searchText
//애플맵 (위경도 지정) - http://maps.apple.com/?ll=latitude,longitude
//앱스토어 (구글맵) - https://itunes.apple.com/kr/app/google-maps/id585027354?mt=8
//유투브 - https://www.youtube.com/watch?v=BzYnNdJhZQw

