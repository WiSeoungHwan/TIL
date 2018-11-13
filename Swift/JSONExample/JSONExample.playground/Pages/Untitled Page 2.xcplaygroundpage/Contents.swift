import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// http://open-notify.org/Open-Notify-API/

//let astronauts = "http://api.open-notify.org/astros.json" // 우주비행사 정보
//let apiURL = URL(string: astronauts)!
//
//let dataTask = URLSession.shared.dataTask(with: apiURL){(data, response, error) in // 데이터 넣어줘서 데이터 가져오기
//    guard let data = data, // 데이터 받아오기
//    let jsonObject = try? JSONSerialization.jsonObject(with: data) as! [String: Any] //데이터를 딕셔너리로 가져옴
//        else {return print("No data")}
//    print("jsonObject", jsonObject)
//
//    guard (jsonObject["message"] as? String) == "success", // 데이터 세부 내용을 타입을 맞춰서 가져온다.
//    let people = jsonObject["people"] as? [[String: String]],
//    let peopleCount = jsonObject["number"] as? Int
//        else {return print("Parsing Error")} // 안되면 파싱 에러 메세지
//    print("\n parsingSuccess------------- \n")
//    print("총 \(peopleCount)명의 우주비행사가 탑승중입니다.")
//    print("= 우주비행사 명단 =")
//    people.compactMap {$0["name"]} //옵셔널제거 를 위해서 compactMap 사용
//        .forEach{print($0)} // 이름 출력
//
//}
//dataTask.resume()

let issLocation = "http://api.open-notify.org/iss-now.json"
let apiURL = URL(string: issLocation)!

let dataTask = URLSession.shared.dataTask(with: apiURL){(data, response, error) in
    guard let data = data,
    let jsonObject = try? JSONSerialization.jsonObject(with: data) as! [String: Any]
        else{return print("No data")}
    print(jsonObject)
    guard let issPos = jsonObject["iss_position"] as? [String:String]
        else{return print("parsing Error")}
    print("경도:\(issPos["longitude"]!) \n위도: \(issPos["latitude"]!)")
    
}

dataTask.resume()
