//
//  DownLoad.swift
//  HalfTunes
//
//  Created by Wi on 10/06/2019.
//  Copyright © 2019 Ray Wenderlich. All rights reserved.
//

import Foundation

class DownLoad {
  var track: Track
  init(track: Track) {
    self.track = track
  }
  
  // DownLoad service set these values:
  
  var task: URLSessionDownloadTask?
  var isDownloading = false
  var resumeData: Data?
  
  // Download delegate sets this value
  
  var progress: Float = 0
}
