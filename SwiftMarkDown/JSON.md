#  JSON (JavaScript Object Notation)


* Javascript 언어로부터 파생 (JavaScript Object Notation) 
* 프로그래밍 언어와 플랫폼 간 독립적이고 가벼워서 XML 방식을 대체하여  
현재 거의 표준으로 사용되고 있는 데이터 교환 형식 
* 두 개의 구조를 기본으로 가짐 
- 'Name : Value' 형태의 쌍을 이루는 콜렉션 타입. 각 언어에서 Hash table, Dictionary 등으로 구현  - 값들의 순서화된 리스트. 대부분의 언어들에서 Array, Vector, List 또는 Sequence 로 구현 
* XML 에 비해 기능이 적고 구조가 단순하여 파싱이 쉽고 빠르며 적은 용량으로 저장 가능  따라서 사람이 읽고 쓰는 것뿐 아니라 기계가 분석하고 생성하는 것에도 (상대적으로) 더 용이
* contents type 은 application/json 이며, 파일 확장자는 .json, 기본 인코딩은 UTF-8 을 사용


## JSON in swift 

```swift
let jsonString = """
{
"someNumber" : 1,
"someString" : "Hello",
"someArray"  : [1, 2, 3, 4],
"someDict"   : {
"someBool" : true
}
}
"""
let jsonData = jsonString.data(using: .utf8)!
let jsonObject = try! JSONSerialization.jsonObject(with: jsonData)
print(jsonObject)

```

## JSONSerialization

* JSON 과 이에 상응하는 Foundation 객체 간 변환하는 객체
* Data 는 다음의 5가지 인코딩 지원 형식 중 하나여야 하며, 이 중 UTF-8 이 기본값으로 쓰이고 가장 효율적 
* JSON 으로 변환되기 위한 Foundation 객체는 다음 속성을 따라야 함
- Top Level Object : NSArray, NSDictionary 
- 모든 객체는 NSString, NSNumber, NSArray, NSDictionary, NSNull 의 인스턴스  - 모든 Dictionary 의 Key 는 NSString 인스턴스 
- 숫자는 NaN 이나 무한대 값이 아니어야 함

* JSON data 로 변환 가능 여부는 isValidJSONObject(_:) 메서드를 통해 확인 가능
