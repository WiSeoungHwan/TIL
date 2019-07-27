import Foundation

func writeJSON(){
    let jsonObject = ["hello": "world","for": "bar","iOS": "Swift"]
    guard JSONSerialization.isValidJSONObject(jsonObject) else {return}
    
    let jsonFilePath = "myJsonFile.json"
    let outputJSON = OutputStream(toFileAtPath: jsonFilePath, append: false)!
    outputJSON.open()
    _ = JSONSerialization.writeJSONObject(
        jsonObject,
        to: outputJSON,
        options: [.prettyPrinted],// 읽기 쉽게 변환해주는 것 sortedKeys //알파벳순으로 정렬하는 것
        error: nil)
    outputJSON.close()
    do{
        let jsonString = try String(contentsOfFile: jsonFilePath)
        print(jsonString)
    }catch{
        print(error.localizedDescription)
    }
}
//writeJSON()

func datawithJSONObject(){
    let jsonObject: [String:Any] = [
        "someNumber": 1,
        "someString": "Hello",
        "someArray": [1,2,3],
        "somDict": ["someBool": true]
    ]
    
    guard JSONSerialization.isValidJSONObject(jsonObject) else{return}
    
    do{
        let encoded = try JSONSerialization.data(withJSONObject: jsonObject)
        let decoded = try JSONSerialization.jsonObject(with: encoded)
        if let jsonDict = decoded as? [String: Any] {
            print(jsonDict)
        }
    }catch{
        print(error.localizedDescription)
    }
}
//datawithJSONObject()

func inputStream(){
    let jsonFilePath = "myJsonFile.json"
    let inputStream = InputStream(fileAtPath: jsonFilePath)!
    inputStream.open()
    defer{ inputStream.close()}
    guard inputStream.hasBytesAvailable else {return}
    do{
        if let jsonObject = try JSONSerialization.jsonObject(with: inputStream) as? [String: Any]{
            print(jsonObject)
        }
    }catch{
        print(error.localizedDescription)
    }
}
//inputStream()
