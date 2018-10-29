#  How Use Plist

## Plist? 

* Plist, 혹은 Property List는 Apple이 선언한 XML 데이터 타입이다. 
* Plist를 읽으면 Array 또는  Dictionary로 읽어지며 plist파일에서 선택가능 하다. 


## Plist 파일 사용법
* new File 에서 PropertyList를 만든다. 
* Root 밑으로 파일을 Array 또는 Dictionary 로 데이터를 만들수 있다. 



## Plist 파일을 불러 오는 법

```swift

// URL 가져오기 
guard let path = Bundle.main.path(forResource: "파일 이름", ofType: "plist")
else { return}


```
* Bundle.main.path 를 이용해서 파일과 URL을 가져올 수 있다. 
* Bundle이란 앱의 정보와 자료를 하나의 공간에 그룹화 해서 저장한 하나의 디렉토리
* 옵셔널 타입으로 들어오기 때문에 옵셔널 바인딩으로 받기 

## Plist 데이터 사용하기 

```swift
//Data 타입으로 데이터 가져오기 
guard let data = try? Data(contentsOf: URL(fileURLWithPath: path) // 위에서 가져온 URL을 넣어준다. 

if let list = try? PropertyListSerialization.propertyList(from: data, format: nil) as! 지정해주었던 타입{

}


```
* 지정해주었던 타입을 NSArray로 바인딩 시켜서 가지고 온 후 다시 스위프트 타입으로 변환 시켜 사용한다. 


