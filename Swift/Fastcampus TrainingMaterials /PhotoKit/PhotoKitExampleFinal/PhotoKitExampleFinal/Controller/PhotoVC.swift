//
//  PhotoVC.swift
//  PhotoKitExampleFinal
//
//  Created by Wi on 04/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit
import Photos

private let reuseIdentifier = "PhotoCell"
private let reuseHeaderIndentifier = "PhotoHeader"

class PhotoVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    
    var images = [UIImage]()
    var assets = [PHAsset]()
    var selectedImage: UIImage?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(PhotoCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.register(PhotoCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseHeaderIndentifier)
        
        collectionView.backgroundColor = .white
        
        fetchPhotos()
    }
    
    // MARK: - UICollectionView

    // MARK: UICollectionViewFlowLayout
    
    // 헤더 크기 정하기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = view.frame.width
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 3) / 4
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // MARK: UICollctionViewDatasource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCell else {fatalError("ㅁ")}
        cell.photoImageView.image = images[indexPath.row]
        return cell
    }
    
    // 나중에 구현
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseHeaderIndentifier, for: indexPath) as? PhotoCell else {fatalError("header is not PhotoCell Type")}
        
        if let selectedImage = self.selectedImage{
            
            // 인덱스 구하기
            if let index = self.images.index(of: selectedImage){
                
                let selectedAsset = self.assets[index]
                
                let imageManager = PHImageManager.default()
                let targetSize = CGSize(width: 600, height: 600)
                
                imageManager.requestImage(for: selectedAsset, targetSize: targetSize, contentMode: .default, options: nil) { (image, info) in
                    
                    header.photoImageView.image = image
                }
            }
            
        }
        
        return header
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.selectedImage = images[indexPath.row]
        self.collectionView.reloadData()
    }
    
    // MARK: - Photos func
    
    func fetchPhotos(){
        // fetch 할 옵션
        let options = PHFetchOptions()
        
        // fetch limit
        options.fetchLimit = .max // 몇개 까지 가져올 것인지
        
        // fetch 된 에셋 정렬
        let sortDescriptor = NSSortDescriptor(key: "creationDate", ascending: false) // 미리 정해진 키값만 가능 , ascending 오름차순인지
        
        // 옵션의 정렬 지정해주기
        options.sortDescriptors = [sortDescriptor]
    
        DispatchQueue.global(qos: .background).async {
            // 사진 에셋 가져오기
            let allPhotos = PHAsset.fetchAssets(with: .image, options: options)
            
            // 에셋 수 만큼 이미지 요청하기
            
            allPhotos.enumerateObjects { (asset, count, stop) in
                // 이미지 매니저 싱글톤 객체
                let imageManager = PHImageManager.default()
                // 사진 사이즈
                let targetSize = CGSize(width: 200, height: 200)
                // 이미지 요청할때 옵션
                let options = PHImageRequestOptions()
                // 이미지를 동기적으로 요청할 것인지
                options.isSynchronous = true
                
                // 이미지 요청
                imageManager.requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFit, options: options, resultHandler: { (image, info) in
                    
                    if let image = image{
                        
                        // 이미지 추가하기
                        self.images.append(image)
                        
                        // selceted 할때 더 큰 이미지를 요청할 용도 에셋 배열에 담아 놓기
                        self.assets.append(asset)
                        
                        if self.selectedImage == nil {
                            self.selectedImage = image
                        }
                        
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                        
                        print("reload")
                    }
                })
            }
        }
        
        
        
        
    }
    
}
