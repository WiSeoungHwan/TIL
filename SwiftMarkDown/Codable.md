#  Codable

* swift4 부터 추가된 프로토콜 

## Encoding


* 정보의 형태나 형식을 표준화, 보안, 처리 속도 향상, 저장 공간 절약 등을 위해서 목적에 맞는 다른 형태나 형식으로 변환하는 처리 혹은 그 처리 방식.
* Encoder : 인코딩을 수행하는 장치나 회로, 컴퓨터 소프트웨어, 알고리즘
* 예) 사람이 보는 방식을 컴퓨터 방식으로 바꿈 


```swift
let encoder = JSONEncoder()
let encodedData = try encoder.encode(decoded)
let encodedString = String(data: encodedData, encoding: .utf8)! print(type(of: encodedString)) // String.Type
```

## Decoding

* Encoding 된 대상을 원래 형태로 되돌리는 일 
* 압축파일을 풀거나 암호화된 내용을 원래 내용으로 되돌리는 일 

```swift
let decoder = JSONDecoder()
let decoded = try decoder.decode(CodableExample.self, from: json) print(type(of: decoded)) // CodableExample.Type
```


## PropertyListDecoder

```swift
let fileURL = URL(fileURLWithPath: "file.plist")
guard let fileData = try? Data(contentsOf: fileURL) else { return }
let plistContent = PropertyListDecoder().decode(CodableType.self, from: fileData)
print(plistContent.key)
```
## JSONDecoder

```swift
let fileURL = URL(fileURLWithPath: "file.json")
guard let jsonData = try? Data(contentsOf: fileURL) else { return }
let decodedContent = JSONDecoder().decode(CodableType.self, from: jsonData)
print(decodedContent.key)
```



## CodingKey

* 인코딩과 디코딩을 위한 키로 사용하기 위해 쓰이는 프로토콜 
* string 과 int 가 있다.


사용법

```swift
struct Dog: Decodable {
let age: Int
let name: String
private enum CodingKeys: String, CodingKey {
case age
case name
}
}

let jsonData = """
{
"age": 3,
"name": "Tory"
}
""".data(using: .utf8)!
let dog = try? JSONDecoder().decode(Dog.self, from: jsonData)
print(dog)
```

컬렉션 타입일 떄 사용법

```swift

//Array
let jsonData = """
[
{
"age": 3,
"name": "Tory"
},
{
}
"age": 3,
"name": "Tory"
]
""".data(using: .utf8)!
let dogs = try! JSONDecoder().decode([Dog].self, from: jsonData)
print(dogs)

//Dictionary

let jsonData = """
{
"first": {
"age": 3,
"name": "Tory"
},
"second": {
"age": 3,
}
"name": "Tory"
}
""".data(using: .utf8)!
let decoder = JSONDecoder()
let dogs = try! decoder.decode([String: Dog].self, from: jsonData)
print(dogs)
```
