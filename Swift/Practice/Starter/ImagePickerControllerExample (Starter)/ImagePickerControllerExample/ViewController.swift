//
//  ViewController.swift
//  ImagePickerControllerExample
//
//  Created by giftbot on 2018. 7. 5..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit
import MobileCoreServices

final class ViewController: UIViewController {

  @IBOutlet private weak var imageView: UIImageView!
  private let imagePickerController = UIImagePickerController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //이미지픽커는 내부적으로 내비게이션컨트롤러를 사용함
    imagePickerController.delegate = self
//    let url = URL(string: UIApplicationOpenSettingsURLString)!
//    UIApplication.shared.open(url)
  }
  
  @IBAction private func pickImage(_ sender: Any) {
    print("\n---------- [ pickImage ] ----------\n")
    //사진첩에 있는 이미지 가져오기
    guard UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) else {return}
    imagePickerController.sourceType = .photoLibrary // 사진
//    imagePickerController.sourceType = .camera // 카메라 띄우기
//
//    imagePickerController.sourceType = .savedPhotosAlbum // 앨범별로
    present(imagePickerController,animated: true)
    
    
  }
  
  //사진찍기
  @IBAction private func takePicture(_ sender: Any) {
    print("\n---------- [ takePicture ] ----------\n")
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else {return} // 가능한지 우선 확인
    print("Available")
    imagePickerController.sourceType = .camera // 카메라 띄우기
    imagePickerController.allowsEditing = true // 사진 설정 허용
    //NSCameraUsageDescription // 카메라 사용 허용
    
    print(imagePickerController.mediaTypes)
    print(UIImagePickerController.availableMediaTypes(for: .camera) ?? [])
    
    let mediaType = UIImagePickerController.availableMediaTypes(for: .camera) ?? []
    imagePickerController.mediaTypes = mediaType
//    imagePickerController.mediaTypes = kUTTypeImage //Mobile CoreSerVice import 해야함
    present(imagePickerController,animated: true)
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [ self] in
        self.imagePickerController.startVideoCapture() //비디오 촬영시작
    }
    
  }
  //딜레이 촬영하는것
  @IBAction private func takePictureWithDelay(_ sender: Any) {
    print("\n---------- [ takePictureWithDelay ] ----------\n")
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else {return}
    
    imagePickerController.sourceType = .camera
    present(imagePickerController,animated: true) {[weak self] in
//        self?.imagePickerController.takePicture()// 자동으로 촬영이 됨
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: { // 타이머의 시간만큼 뒤에 사진을 찍는다. 사용자가 입력하게 할 수도
            self?.imagePickerController.takePicture()
        })
//        kUTTypeImage // public.image
//        kUTTypeVideo //no Audio
//        kUTTypeMovie // Video + Audio
        
    }
  }
  
  
  @IBAction private func recordingVideo(_ sender: Any) {
    print("\n---------- [ recordingVideo ] ----------\n")
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else {return}
    imagePickerController.sourceType = .camera
    
    imagePickerController.mediaTypes = [kUTTypeMovie as String]
//    imagePickerController.mediaTypes = ["public.movie"] //위에것과 같은 것
//    imagePickerController.cameraDevice = .front // 전면카메라
//    imagePickerController.cameraDevice = .rear // 후방 카메라
    imagePickerController.cameraCaptureMode = .video
    imagePickerController.cameraDevice = .front
    imagePickerController.cameraFlashMode = .auto // 플래시 모드
    
    present(imagePickerController,animated: true)
    
  }
  
  @IBAction private func toggleAllowsEditing(_ sender: Any) {
    print("\n---------- [ toggleAllowsEditing ] ----------\n")
    //사진을 설정가능하게 하는 것
    imagePickerController.allowsEditing = !imagePickerController.allowsEditing
//    imagePickerController.allowsEditing.toggle() 위에있는거랑 같은거
    
  }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info)
        // 사진을 수정하고 보여주는 것
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        if UTTypeEqual(mediaType, kUTTypeImage) {// 이미지 일떄
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage
            var selectedImage = editedImage ?? originalImage
            imageView.image = selectedImage
            UIImageWriteToSavedPhotosAlbum(selectedImage, nil, nil, nil) 
            
        }else if UTTypeEqual(mediaType, kUTTypeMovie){
            print(info)
            let url = info[UIImagePickerControllerMediaURL] as! NSURL
            UISaveVideoAtPathToSavedPhotosAlbum(url.path!, nil, nil, nil)
        }
        picker.dismiss(animated: true)

        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("cancel")
        picker.dismiss(animated: true)
    }

}
