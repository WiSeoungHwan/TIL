import Foundation

struct Dog: Codable{
    let age: Int
    let name: String
    
    
}

func codableBasic(){
    let jsonData = """
    {
        "age": 3,
        "name": "Tory"
    }
    """.data(using: .utf8)!
    guard let dog1 = try! JSONSerialization.jsonObject(with: jsonData) as? [String: Any] ,
    let age = dog1["age"] as? Int,
    let name = dog1["name"] as? String
    
    else {return print("passing error")}
    
    let dog = Dog(age: age, name: name)
    print(dog.age)
    print(dog.name)
    
    let dog2 = try! JSONDecoder().decode(Dog.self, from: jsonData)
    print(dog2.age)
    print(dog2.name)
}

//codableBasic()

func codableArray() {
    print("\n---------- [ array ] ----------\n")
    let jsonData = """
  [
    { "age": 3, "name": "Tory" },
    { "age": 3, "name": "Tory" },
  ]
  """.data(using: .utf8)!
    print(jsonData)
    
    // JSONSerialization
    let jsonObject = try! JSONSerialization.jsonObject(with: jsonData) as! [[String: Any]]
    let first = jsonObject.first!
    print(Dog(age: first["age"] as! Int, name: first["name"] as! String))
    
    // Codable
    let dogs = try! JSONDecoder().decode([Dog].self, from: jsonData)
    dogs.forEach { print($0) }
}

//codableArray()


func codableDictionary() {
    print("\n---------- [ dictionary ] ----------\n")
    let jsonData = """
  { "first": {
      "age": 3,
      "name": "Tory"
    },
    "second": {
      "age": 4,
      "name": "Tory"
    }
  }
  """.data(using: .utf8)!
    
    // JSONSerialization
    let dogs1 = try! JSONSerialization.jsonObject(with: jsonData) as! [String: [String: Any]]
    let first = dogs1["first"]!
    print(Dog(age: first["age"] as! Int, name: first["name"] as! String))
    
    // Codable
    let dogs = try! JSONDecoder().decode([String: Dog].self, from: jsonData)// 제이슨 데이터에 대한 클래스나 struct를 짠 후에 그 타입을 넣어 준다.
    dogs.forEach { print($0, $1) }
}

codableDictionary()
