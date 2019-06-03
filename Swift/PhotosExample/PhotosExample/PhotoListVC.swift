//
//  PhotoListVC.swift
//  PhotosExample
//
//  Created by Wi on 03/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit
import Photos

class PhotoListVC: UITableViewController {
    
    // MARK: 섹션 타입 열거형
    enum Section: Int {
        case allPhotos = 0
        case smartAlbums
        case userCollections
        
        static let count = 3
    }
    
    // MARK: - Properties
    
    var allPhotos: PHFetchResult<PHAsset>!
    var smartAlbums: PHFetchResult<PHAssetCollection>!
    var userCollection: PHFetchResult<PHCollection>!
    
    var sectionTitle = ["All Photo", "Smart Albums", "User Collection"]
    
    // MARK: - UIViewController / Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 사진 배열 채우기
        
        let allPhotosOptions = PHFetchOptions()
        allPhotosOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        
        // 모든 사진 가져오기
        allPhotos = PHAsset.fetchAssets(with: allPhotosOptions)
        
        
    }

    // MARK: - Table view

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section)!{
        case .allPhotos: return 1
        case .smartAlbums: return smartAlbums.count
        case .userCollections: return userCollection.count
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if let optionalCell = tableView.dequeueReusableCell(withIdentifier: "allPhoto") {
            cell = optionalCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "allphoto")
        }
        cell.textLabel?.text = "All photos"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let resultVC = ResultVC(collectionViewLayout: UICollectionViewFlowLayout())
            
            navigationController?.pushViewController(resultVC, animated: true)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }

   

}
