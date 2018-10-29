//
//  ViewController.swift
//  PlistExample
//
//  Created by Wi on 29/10/2018.
//  Copyright © 2018 Wi. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    var data: [String : Array<String> ] = [:]
    var dataArray: [String] = []
    
    @IBOutlet private weak var tableView: UITableView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
//        handlebundleFile()
        
        propertyListSerialzation()
    }
//    func handlebundleFile(){
//        print("[-------bundleData------]")
//
//        guard let path = Bundle.main.path(forResource: "idolGroups", ofType: "plist"),
//        let contents = NSArray(contentsOfFile: path) as?  [String]
//            else {return}
//        dataArray = contents
//        print("idols file path:", path)
//        print(contents)
//
//        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
//        let destPath = documentPath + "/copied.plist"
//        let fileManger = FileManager.default
//        if !fileManger.fileExists(atPath: destPath){
//            do {
//                try fileManger.copyItem(atPath: path, toPath: destPath)
//            }catch{
//                print("파일복사 에러 :", error.localizedDescription)
//            }
//        }
//        if let files = try? fileManger.contentsOfDirectory(atPath: documentPath){
//            print("\(files.count) Files in Documents: \(files)")
//        }
//        print("_____Load & Change Data")
//        guard var copiedData = NSArray(contentsOfFile: destPath) as? [String] else {return}
//        //idols.plist -읽기전용
//        //copied.plist -읽기쓰기
//        let newData = "아이유"
//        if !copiedData.contains(newData){
//            copiedData.append(newData)
//            (copiedData as NSArray).write(toFile: destPath, atomically: true)
//        }
//        if let newContents = NSArray(contentsOfFile: destPath) as? [String]{
//            dataArray = newContents
//            print(newContents)
//        }
//
//    }
    func propertyListSerialzation(){
        print("________propertyListSerialzation")
        guard let path = Bundle.main.path(forResource: "idolGroups", ofType: "plist"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path))
            else {return}
        
        if var list = try? PropertyListSerialization.propertyList(from: data, format: nil) as! NSDictionary {
            
            let newList = try! PropertyListSerialization.data(fromPropertyList: list, format: .xml, options: 0)
            let url = URL(fileURLWithPath: path)
            try! newList.write(to: url)
            print("url:", url)
            
        }
        guard  let newData = try? Data(contentsOf: URL(fileURLWithPath: path)) else {return}
        if let newList = try? PropertyListSerialization.propertyList(from: newData, format: nil) as! NSDictionary{
            self.data = newList as! [String: [String]]
            for i in self.data.keys {
                if i == "Boy"{
                    self.dataArray = self.data["Boy"]!
                }
                if i == "Girl"{
                    self.dataArray = self.data["Girl"]!
                }
            }
            print(self.data)
        }
//        tableView.reloadData()
    }
    func printPath(){
        print("[-------Print Path------]")
        
        //bundle
        let bundlePath = Bundle.main.bundlePath
        print("[bundle] :", bundlePath)
        //Data home Directory
        let homeDirectoryPath = NSHomeDirectory()
        print("[bundle] :", homeDirectoryPath)
        
        //Document Directory
        let documentPath = NSHomeDirectory() + "/Documents"
        print("[bundle] :", documentPath)
        let _ = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let libraryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print("[Library] : ", libraryPath)
        
    }

}

extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var array = [""]
        for i in self.data.keys {
            if i == "Boy"{
                array = self.data["Boy"]!
            }
            if i == "Girl"{
                array = self.data["Girl"]!
                
            }
        }

        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var array = [""]
        for i in self.data.keys {
            if i == "Boy"{
                array = self.data["Boy"]!
                cell.textLabel?.text = array[indexPath.row]
            }
            else if i == "Girl"{
                array = self.data["Girl"]!
                cell.textLabel?.text = array[indexPath.row]
            }
        }
        
        
        
        return cell
    }
    
    
}
