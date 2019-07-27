//
//  FeedManager.swift
//  Instagram
//
//  Created by Wi on 24/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation


// 매니저 클래스의 유무는 선택사항입니다.

class FeedManager {
    // 싱글턴 선언
    static let shared = FeedManager()
    // 피드 데이터 배열선언
    var feedDatas = [FeedData]()
    private init() {}
    
}
