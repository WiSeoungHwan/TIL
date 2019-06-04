//
//  ResultVC.swift
//  PhotosExample
//
//  Created by Wi on 03/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit
import Photos
import PhotosUI

private let reuseIdentifier = "Cell"

class ResultVC: UICollectionViewController {
    
    var fetchResult: PHFetchResult<PHAsset>!
    let imageManager = PHCachingImageManager()
    var thumbnailSize: CGSize = CGSize(width: 50, height: 50)

    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Register cell classes
        self.collectionView!.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchResult.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let asset = fetchResult.object(at: indexPath.item)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ImageCollectionViewCell else { fatalError("cell not type")}
        
        if asset.mediaSubtypes.contains(.photoLive) {
            cell.livePhotoImageView.image = PHLivePhotoView.livePhotoBadgeImage(options: .overContent)
        }
        imageManager.requestImage(for: asset, targetSize: thumbnailSize, contentMode: .aspectFill, options: nil) { (image, _) in
            cell.photoImageView.image = image
        }
    
        
        return cell
    }

    

}
