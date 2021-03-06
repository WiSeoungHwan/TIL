//
//  Track.swift
//  URLSessionPractice
//
//  Created by Wi on 10/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation

struct Result: Decodable {
    let results: [Track]
}

struct Track: Decodable{
    let artistName: String
    let trackName: String
    let artworkUrl100: String
    let previewUrl: String
    let collectionName: String
    let releaseDate: String
    let collectionPrice: Double
}
