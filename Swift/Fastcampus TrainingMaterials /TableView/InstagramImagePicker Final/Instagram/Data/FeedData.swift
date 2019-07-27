//
//  FeedData.swift
//  Instagram
//
//  Created by Wi on 14/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class FeedData {
    // image 들의 타입이 String 에서 UIImage 로 바뀌었어요.
    let profileImage: UIImage?
    let nickName: String?
    let feedImage: UIImage?
    var comment: [String]? = ["ㅋㅋㅋㅋ", "lol"] // 기본값
    let explanation: String? // 사진 설명 변수가 추가되었어요.
    
    init(profileImage: UIImage?, nickName: String?, feedImage: UIImage?, explanation: String?) {
        self.profileImage = profileImage ?? UIImage(named: AppImageData.profile + "\(3)")
        self.nickName = nickName ?? "NickName"
        self.feedImage = feedImage ?? UIImage(named: AppImageData.feedImage + "\(1)")
        self.explanation = explanation
    }
    
}
