//
//  SearchVC + URLSessionDelegates.swift
//  HalfTunes
//
//  Created by Wi on 10/06/2019.
//  Copyright © 2019 Ray Wenderlich. All rights reserved.
//

import Foundation
import UIKit


extension SearchViewController: URLSessionDownloadDelegate {
  
  func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
    if let appDelegate = UIApplication.shared.delegate as? AppDelegate,
      let completionHandler = appDelegate.backgroundSessionCompletionHandler {
      appDelegate.backgroundSessionCompletionHandler = nil
      DispatchQueue.main.async {
        completionHandler()
      }
    }
  }
  
  func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
    // 1
    guard let url = downloadTask.originalRequest?.url,
      let download = downloadService.activeDownloads[url] else {return}
    // 2
    download.progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
    // 3
    let totalSize = ByteCountFormatter.string(fromByteCount: totalBytesExpectedToWrite, countStyle: .file)
    // 4
    DispatchQueue.main.async {
      if let trackCell = self.tableView.cellForRow(at: IndexPath(row: download.track.index, section: 0)) as? TrackCell{
        trackCell.updateDisplay(progress: download.progress, totalSize: totalSize)
      }
    }
  }
  
  func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
      // 1
    guard let sourceURL = downloadTask.originalRequest?.url else {return}
    let download = downloadService.activeDownloads[sourceURL]
    downloadService.activeDownloads[sourceURL] = nil
    // 2
    let destinationURL = localFilePath(for: sourceURL)
    print(destinationURL)
    // 3
    let fileManager = FileManager.default
    try? fileManager.removeItem(at: destinationURL)
    do {
      try fileManager.copyItem(at: location, to: destinationURL)
      download?.track.downloaded = true
    } catch let error {
      print("Could not copy file to disk: \(error.localizedDescription)")
    }
    // 4
    if let index = download?.track.index{
      DispatchQueue.main.async {
        self.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
      }
    }
  }
}
