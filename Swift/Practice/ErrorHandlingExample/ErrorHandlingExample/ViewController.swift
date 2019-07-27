//
//  ViewController.swift
//  ErrorHandlingExample
//
//  Created by Wi on 08/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let tmpDir = NSTemporaryDirectory() // 임시 파일 저장소
    private let filepath = NSTemporaryDirectory() + "swift.txt"
    private let errorFilePath = NSTemporaryDirectory() + "errorFile.txt"
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        createDummyFIle()
        basic()
        threeTypesOfTry()
    }
    
    private func createDummyFIle(){
        let str = "Swift Error Handling"
        try? str.write(toFile: filepath, atomically: true, encoding: .utf8)
    }
    private func basic(){
        print("\n basic \n")
        let str = "Swift Error Handling"
        do{
            print(1)
            try str.write(toFile: filepath, atomically: true, encoding: .utf8)
            print(2)
            try str.write(toFile: tmpDir, atomically: true, encoding: .utf8)
            print(3)
        }catch let error { // 에러라는 변수를 받아서 처리를 해도 되고 적어주지 않아도 error 로 사용 가능 하다
            print(error)
            print(error.localizedDescription)
        }
    }
    
    private func threeTypesOfTry(){
        print("\n try Types\n")
        
        // 1. try
        // do catch 없이 단독 사용 불가
        //2 . try?
        // 성공하면 옵셔널 , 에러면 nil
        let contentsOptional = try? String(contentsOfFile: filepath)
        print(contentsOptional ?? "")
        //3. try!
        // 옵셔널 강제 언래핑 에러발생시 crach
        let contentsUnwrapped = try! String(contentsOfFile: filepath)
        print(contentsUnwrapped)
    }
    
    private func throwNSError() throws{
        throw NSError(domain: "domain data", code: 99, userInfo: ["Mykey": "Myvalue"])
    }
    private func throwError() throws{
        throw MyError.errorWithParam(num: 10)
    }
    enum MyError: Error {
        case errorExample
        case errorWithParam(num: Int)
    }

    private func throwsFunctionExample(){
        do{
            try throwNSError()
        }catch{
            print("Error:",error)
            let e = error as NSError
            print("NSError:", e)
            print("domain: ",e.domain)
            print("code", e.code)
            print("userInfo", e.userInfo)
        }
    }
    private func errorMatching(){
        do{
            try throwError()
        }catch MyError.errorExample{
            print("Error Example")
        }catch{
            
        }
    }
    
}

