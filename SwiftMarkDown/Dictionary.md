# Dictionary

* [key: value] 로 이루어져 있다. 
* 데이터를 저장하는데 주로 쓰이는 형식 
* 배열과 달리 순서가 없고 key 값으로  데이터를 구분한다.

## Dictionary Example 
```swift
//선언
var dictionary: [String: Any]

// dictionary 
dictionary = ["key": "value", "stringArray": ["value","value2"] , "intArray":[0,1,2,3,], "Dictionary": ["key": "value"]]

```
* Dictionary는 타입을 맞춰 줄 수도 있고 위의 예시와 같이 Any 타입으로 선언해서 다양한 타입을 담을 수있다. 
* Dictionary 안에 다시 Dictionary를 넣을 수 있기때문에 json 데이터에도 쓰인다. 
---
## Dictionary in Dictionary in Dictionary

```swift
dictionary = ["dic1":["dic2":["dic3":["dic4":"value"]]]]

```

*  요런것 도 가능 ... 
----

## Dictionary Add


```swift
dictionary["newKey"] = "NewValue"

```
* 딕셔너리 변수 이름뒤 [ ] 안에 새로 넣을 키값을 넣고 값을 넣어준다. 

----

## Dictionary Remove 
```swift
dictionary["NewKey"] = nil
dictionary.removeValue(forKey: "NewKey")

```

* 두가지 방법중 어느것을 써도 무방 

## Dictionary Update
```swift
dictionary.updateValue("수정될 내용 ", forKey: "해당 키")

```

* 값을 변경해야 할때는 이렇게! 
