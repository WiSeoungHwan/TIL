//
//  ViewController.swift
//  LogFunctionExample
//
//  Created by Wi on 15/11/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit

//Free Function (print 같이 어느곳에서 사용가능한 함수 )
//#file, #function, #line, #column
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        info("Helloworld",header: "my Logger")
    }


}

func info (
    _ contents: Any..., //Variadic parameter
    header: String = "",
    _ file: String = #file,
    _ function: String = #function,
    _ line: Int = #line ){
    let emoji = "🌈"
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss:SSS"
    let timestamp = dateFormatter.string(from: Date())
    
    let fileUrl = URL(fileURLWithPath: file)
    let fileName = fileUrl.deletingPathExtension().lastPathComponent
    let header = header.isEmpty ? "" : "[\(header)] -"
    let content = contents.reduce(""){$0 + "" + String(describing: $1)}
    print("\(emoji)\(timestamp)\(fileName) / \(function)\(line)\(emoji)\(header)\(content)")
}
