//
//  FeedProvider.swift
//  FeedExample
//
//  Created by Wi on 31/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import Foundation

class FeedProvider {
    //Singlton Instance
    static let shared = FeedProvider()
    var user: [User]
    
    init() {
        // 특정경로에 파일이 있는지 확인
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let destinationPath = path + "/TodoList.plist"
        
        // 없다면  번들에 있는 ㅏㅍ일을 특정 경로에 복사
        if !FileManager.default.fileExists(atPath: destinationPath){
            let bundlePath = Bundle.main.path(forResource: "FeedInfomation", ofType: ".plist")!
            
            do{
               try FileManager.default.copyItem(atPath: bundlePath, toPath: destinationPath) // 복사
            }catch{
                print("error")
            }
            
        }
//        있다면파일을 가져와 인스턴스를 만든다.
        guard let array = NSArray(contentsOfFile: destinationPath) as? [[String: Any]] else {return}// 경로를 입력하면 경로의 어레이를 인스턴스
        for element in array {
            User(dictionary: element)
        }
        
        
    }
    
}
