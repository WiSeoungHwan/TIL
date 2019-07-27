//
//  CardData.swift
//  FirebaseExample
//
//  Created by Wi on 20/07/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation

// MARK: - CardData
struct CardDataStruct: Codable {
    let id, rank, name: String
    let imageURL: String
    let imageOrientaion: ImageOrientaion
    
    enum CodingKeys: String, CodingKey {
        case id, rank, name
        case imageURL = "image_url"
        case imageOrientaion = "image_orientaion"
    }
}

enum ImageOrientaion: String, Codable {
    case landscape = "landscape"
    case portrait = "portrait"
}


//class CardData{
//    let id, rank, name: String
//    let imageURL: String
//    let imageOrientation: ImageOrientaion
//    
////    init(dictionary: [String: AnyObject]) {
////        guard
////            let id = dictionary["id"] as? String
////            let rank = dictionary["rank"] as? String
////            let name = dictionary["name"] as? String
////    }
//}

