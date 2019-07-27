#  Error Handling


## 에러를 정의하는 기준 

스위프트는 심각성에 따라서 기준이 나뉜다 

* 단순 도메인 오류 
명백하게 실패하도록 되어있는 연산 이나 추측
오류에 대한 자세한 설명이 필요없다. 

* 복구 가능한 오류 
복잡한 연산을 수행하는 도중 실패할 수 있지만 사전에 미리 오류를 합리적으로 예측할 수 있는 작업 
미리 오류를 처리하는 코드를 작성하는 것이 좋다 

* 범용 오류
시스템이나 어떤 다른 요인에 의한 오류 

* 논리적오류 
프로그램적으로 컨트롤 할 수 없는 오류에 해당 


## 에러 핸들링 

* 프로그램 동작중 예상 가능한 오류가 발생했을때를 대비하여 미리 처리해두는 것 

## 에러를 잡는 4가지 방법 

### throws 키워드 

오류에 대한 처리를 코드 다른 부분에서 처리 하도록 throws 키워드를 명시적으로 선언한다
throws 키워드가 없을 떄는 오류를 함수 내에서 처리해야함 

```swift 
// 예시 적기 
```
* throws function > non throws function

throws  가 아닌 함수를 throws에 넣는건 가능 
반대는 불가능 

```swift
// OK
func cannotThrowFunction() -> Int { return 10 }
func canThrowFunction(_ generator: () throws -> Int) -> Void { }
canThrowFunction(cannotThrowFunction)
// Error
func canThrowFunction() throws -> Int { return 10 }
func cannotThrowFunction(_ generator: () -> Int) -> Void { }
cannotThrowFunction(canThrowFunction)
```


* rethrows 

rethrows 를 써야될때는 throws를 선언된것을 다시 다른 함수 에 넘길때 쓴다


### do - catch 키워드 

* do 문에서 에러가 나면 catch 문으로 빠진다 




### converting Errors to Optional Values

* try? 를 사용해서 정상수행시 Optional 반환 오류 발생시 nil 반환
* do catch 에 비해 간단한 상황일때 사용 


* do catch 문과 비교 

```swift
func someThrowingFunction() throws -> Int {
// ...
}
let x = try? someThrowingFunction()
let y: Int?
do {
y = try someThrowingFunction()
} catch {
}
```

* try 사용 예시 
```swift
func fetchData() -> Data? {
if let data = try? fetchDataFromDisk() { return data }
if let data = try? fetchDataFromServer() { return data }
return nil
}
```


### Disabling Error Propagation

* try! 오류가 발생하지 않는다고 확신 할 수 있는 경우에만 사용 


 ----
## Specifying Cleanup Actions

* defer - 현재 코드 블럭이 종료되기 직전에 반드시 실행되어야 하는 코드 등록
  해당 범위가 종료될 때까지 실행을 연기하며 소스 코드에 기록된 순서의 역순으로 동작
* throws 키워드가 없어도 사용 가능 
* defer의 위치 중요   

* class 의 deinit 과 비슷한 개념 

```swift
func processFile(filename: String) throws {
if exists(filename) {
let file = open(filename)
defer {
close(file)
}
while let line = try file.readline() {
// Work with the file.
}
// close(file) is called here, at the end of the scope.
}
}
```
---

##  Error

* 스위프트에서는 프로토콜로 정의되어있다 
* object- c 에서는 클래스로 정의되어있다 .


