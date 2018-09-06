#  Swift 문법 정리

## 명명법 
* Lower Camel Case : 단어의 시작 글자로 소문자로 만들고 그 뒤부터 단어의 시작부분은 대문자로 만든다.(함수, 변수)
* Upper Camel Case:  단어의 시작을 대문자로 만든다. (class, struct, enum, extension)
* __ Swift 는 모든 대소문자를 구별한다.__

---
## 상수와 변수 

### 상수와 변수 선언 

```swift
let 상수 : 타입 = 값
var 변수 : 타입 = 값

//값의 타입이 명확할때 타입은 생략이 가능하다.
let 상수 = 값
var 변수 = 값
```
* let  : 상수를 선언할때 쓰며  값을 할당한 후엔 값을 변경 불가능하다.
* var : 변수를 선언할때 쓰며  값을 할당한 후에 값이 변경 가능하다.
---
## 기본 데이터 타입 

### 1. Bool

* true 와 false 만을 값으로 가진다. 

### 2. Int,UInt

* Int : 정수타입을 나타내는 현재 64비트 정수형
* UInt: 정수 타입을 나타내는 부호가 없는 64비트 정수형

### 3. Float, Double

* Float : 실수를 나타내는 32비트 부동소수형
* Double : 실수를 나타내는 64비트 부동소수형 (Float 보다 범위가 크다.)

### 4. Character , String 

* Character : 문자 하나만 나타내는 문자타입. 유니코드를 사용. 큰따옴표 "" 사용
* String :  문자 여러개를 나타내는 문자열 타입. 유니코드 사용 . 큰따옴표 "" 사용 

---

## Any, AnyObject, nil

### 1. Any

* Swift 의 모든 타입을 지칭하는 __키워드__

### 2. AnyObject

* 모든 클래스 타입을 지칭하는 __프로토콜__

### 3. nil

* 없음을 뜻하는 키워드 
* 다른 언어의 __null__, __NULL__, __Null__ 과 같다.

---

## 컬렉션 타입

* Array : 순서가 있는 리스트 컬렉션
* Dictionary : 순서가 없고 키와 밸류로 이루어진 컬렉션
* Set : 순서가 없고 멤버가 유일한 컬렉션 ( 집합 )

### Array( 배열 ) 

*  데이터를 추가할 때마다 데이터에 순서(index)가 매겨진다. 
*  index를 통해 데이터에 접근할 수 있다. 
*  index 는 0 부터 시작한다.

```swift
// Araay 선언 및 생성 
var integers : Array<Int> = Array<Int>()
// 배열을 선언 및 생성할 때 더 다양하고 간편하게 선언할 수 있다.
// ex) var integers : [Int]()

//Array 추가 
integers.append(1)
integers.append(33) // [1,33] 왼쪽에서 부터 0,1


//Array 삭제 

integers.remove(at: 0)// 해당 인덱스에 해당하는 데이터 삭제
integers.removeLast()//마지막 인덱스 삭제
integers.removeAll()//모든 인덱스 삭제

//Array 포함 여부 조회 
//contains true false 로 반환을 한다.
print(integers.contains(33)) // true
print(integers.contains(77)) // false


```



