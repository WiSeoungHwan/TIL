#  Swift 문법 정리

야곰님의 강의에 살을 붙여 정리하는 중입니다. 

---


## 명명법 
* Lower Camel Case : 단어의 시작 글자로 소문자로 만들고 그 뒤부터 단어의 시작부분은 대문자로 만든다.(함수, 변수)
* Upper Camel Case:  단어의 시작을 대문자로 만든다. (class, struct, enum, extension)
* __Swift 는 모든 대소문자를 구별한다.__

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

### Dictionary

* 키와 값으로 이루어진 컬렉션 타입

```swift

// Dictionary 선언과 생성
var anyDictionary : Dictionary<String : Any = [String, Any]()

// Dictionary 도 선언시에 더 다양하고 간편하게 생성할 수 있다.
// ex) var anyDictionary = [String: Any]()


// Dictionary 값 할당
anyDictionary["someKey"] = "값"

// Dictionary 값 변경
anyDictionary["someKey"] = "value"

// Dictionary 키 값 제거 
anyDictionary.removeValue(forKey: "someKey")
anyDictionary["someKey"] = nil

// 불변 Dictionary 만들기
let emptyDictionary : [String: String] = [:]

```

### Set 

* 멤버가 중독되지 않고 순서없이 존재하는 컬렉션

```swift

//Set 생성 및 선언 
var integerSet: Set<Int> = Set<Int()

//Set 추가 insert
integerSet.insert(1)
integerSet.insert(11)
integerSet.insert(11) // 동일한 값은 두번 insert 해도 한번만 저장된다. 


//Set 포함여부 확인 contains
print(integerSet.contains(1))//true
print(integerSet.contains(2))//false

//Set 멤버 삭제 
integerSet.remove(11)
integerSet.removeFirst() // 먼저 추가된 멤버 삭제 

//Set 멤버 개수 확인 

integerSet.count

```

---


## 함수 기본

* 함수의 기본형태

```swift

func 함수이름(매개변수1이름 : 매개변수1타입, 매개변수2이름: 매개변수2타입 ...) -> 반환타입{
//함수 구현부

    return 반환값
}
```

* 반환 값이 없는 함수 

```
// 예시)
func printMyName(name: String) -> Void{// 반환값이 없는 경우 Void 생략가능 
print(name)
}

```

* 매개변수가 없는 함수 

```swift

func 함수 이름() -> 반환타입 {
    return 반환값 
}

```

* 매개변수와 반환값이 없는 함수 

```swift

func 함수이름(){ // return을 생략해도 오류는 발생하지 않는다.
    return
}

```
* 함수 호출

```swift
함수이름(매개변수 : 값) 

```


---



## 함수 고급


### 매개변수 기본값

* 매개변수에 기본적으로 기본값을 지정할 수도 있고 나중에 다시 지정할 수도 있다. 
* 기본값 가지는 매개변수는 함수 호출시에 이미 값이 지정되어 있기 때문에 생략을 할 수있다. 
* 기본값이 있는 매개변수는 매개변수들 중에서 가장 뒤에 위치하는 것이 좋다. 

```swift

//매개변수 기본값

func greeting(friend: String, me: String = "Seong Hwan"){
print("Hello \(friend), I'm \(me)")
}

greeting(friend: "Jo")

///설명 매개변수에 기본적으로 기본값을 지정할 수도 있고 나중에 다시 지정할 수도 있다.
///    기본값을 가지는 매개변수는 생략이 가능하다.

```

### 전달인자 레이블 

* 매개변수에 전달인자 레이블을 붙임으로써 같은 이름의 함수이지만 다른 함수로 인식이 되어 오류가 나지 않는다. 
* 동일한 함수를 전달인자 레이블만 변경하여 중복으로 생성할 수 있다.
* 함수를 호출할때 함수를 쓰는 사람 입장에서 변수의 역할을 더 명확하게 표현하고자 할때 사용된다. 

```swift
//전달인자 레이블

func greeting(to friend: String, from me: String){
print("Hello \(friend), I'm \(me)")
}

greeting(to: "Kim",from: "SeongHwan")// 함수를 호출할떄는 전달인자 레이블을 사용한다.
///설명 매개변수에 전달인자 레이블을 붙임으로써 같은 이름의 함수이지만 다른 함수로 인식이 되어 오류가 나지 않는다.
///    greeting의 전달인자 레이블인 to와 from까지 함수 이름으로 취급이 되기 때문에 다른함수로 인식된다.
///    동일한 함수를 전달인자레이블만 변경하여 중복으로 생성할 수 있다.
///    함수를 호출할떄 함수를 쓰는 사람 입장에서 변수의 역할을 더 명확하게 표현하고자 할때 사용한다.



```

### 가변매개변수 

* 가변매개변수는 매개변수가 전달받을 값의 개수를 알 수 없을때 사용한다.
* 가변매개변수 역시 기본값이 있는 매개변수와 마찬가지로 매개변수 중에 뒤에 위치한다.
* 가변매개변수는 함수당 하나만 가질수 있다. 
* 가변매개변수, 기본값이 있는 매개변수, 전달인자레이블, 반환값이 없는 함수 모두 섞어서 사용가능하다. 

```swift

//가변매개변수

func sayHelloToFried(from me: String = "SeongHwan", to friends: String...){///...과 타입간에 띄어쓰기 하면 안됨!
print("Hello \(friends), I'm \(me)")
}
//함수 설명 전달인자 레이블을 사용했고 매개변수 기본값을 하나 정해주었다. 그리고 반환값이 없으므로 Void를 생략해주었고 friends를 가변매개변수로 설정해 값을 하나이상 들어올수있게 하엿다.
sayHelloToFried( to: "risa", "jisu","jenny","roje")

///설명   가변매개변수는 매개변수가 전달받을 값의 개수를 알수없을때 사용한다.
///      가변매개변수 역시 기본값이 있는 매개변수와 마찬가지로 매개변수중에 뒤에 위치한다.
///      가변매개변수는 함수당 하나만 가질수 있다.
///      가변매개변수, 기본값이 있는 매개변수, 전달인자레이블 , 반환 값이 없는 함수 모두 섞어서 사용가능하다.

```

### 데이터 타입으로써 함수 

* swift는 함수형 프로그래밍 패러다임을 포함하는 다중 패러다임 언어이므로 스위프트의 함수는 일급객체이다. 그렇기 때문에 함수를 변수, 상수등에 할당이 가능하고 매개변수를 통해 전달할 수도 있다.
* __함수의 타입표현:  반환타입을 생략할 수 없다.__

```swift

///변수의 타입으로 함수 사용하기
var someFunction: (String,String) -> Void = greeting(to:from:)//기본값을 정해주었는데 오류가 난다.
someFunction("risa","jiso")//타입이 다른 함수는 할당할 수 없다.

///함수의 타입으로 함수를 사용하기

func runAnother(functionName: (String,String) ->Void){//매개변수로 되는 함수의 이름을 변수이름을 짓는 것처럼 지을 수 있다.
functionName("jenny","risa")
}

runAnother(functionName: someFunction)// 변수로 랩핑한 함수를 매개변수로 넣어줄 수 있다.

runAnother(functionName: greeting(friend:me:))// 함수를 넣어준것

```

---

## 조건문 


### if-else문 

*  if 문 뒤에 조건을 감싸는 소괄호는 생략가능
* 조건값에는 Bool타입의 값만 들어올 수 있다.

```swift

if 조건{

}else if 조건{

}else{

}
```


### guard 문 

* guard 문은 if else 문과 동일하게 쓸 수있지만 사용하는 상황이 조금씩 다르다.
* guard 문의 역할은 빠른 탈출을 위해 쓰인다. 
* guard 문에서는 else if를  쓸 수 없다. 
* guard 문의 else에는 탈출구문이 있어야 한다.

```
func someFunc() {// 조건을 판별해서 조건이 아닐시에 빠르게 탈출하는 역할!
guard true else { return } // 탈출 구문이 들어가 있어야한다.
// if문에 해당하는 내용

}


```


### switch 문

* switch 의 비교값에 대부분의 스위프트 기본타입을 지원한다.
* 각각 case 내부에는 실행가능한 코드가 반드시 있어야한다. 
* enum의 case 같이 값이 매우 한정적인 비교값이 아닌 한  defult 구문은 반드시 작성해야 한다. 
* 명시적으로 break를 해주지 않아도 자동적으로 break 된다.
* fallthrough 키워드를 사용하여 break를 무시 할수 있다.( case 를 이어서 사용하고 싶을때 많이 사용한다.)
* 또 다른 방법은 ,를 사용하여 하나의 case에 여러 패턴을 명시할 수 있습니다.
* where 문으로 case에 조건을 줄 수 있다. 

```swift

switch 비교값{
    case 패턴:
    
    default:
    
}

//where의 활용 

var sum = 1

switch sum{
case _ where sum > 3:
print("크다")
case _ where sum < 3:
print("작다")
default:
break

}



```


---

## 반복문

* for-in
* while
* repeat-while


### for-in 문

```swift

for item in items{// items 안의 수만큼 반복한다.
 //실행 구문 
}


var integers = [1,2,3]
let people = ["jenny": 10, "risa": 15, "mike": 12]

for integer in integers{// in 안에 있는 수많큼
print(integer)
}

for(name, age) in people{ // people 안의 수만큼
print("\(name): \(age)")// 키와 딕셔너리 값을 출력 한다.
}

```

### while 문 
 
 ```swift
 
 while integers.count > 1{ // 조건을 만족할때 까지 반복 한다. 
 integers.removeLast()
 }
 
 ```

### repeat-while 문 

* C#의 do-while문과 유사하다.

```swift

repeat{//repeat 구문이 먼저 한번 동작한뒤에 while문의 조건에 따라 작동된다. 
integers.removeLast()
}while integers.count > 0

print(integers)

```


---

## 옵셔널

* 값이 있을 수도 없을 수도 있음을 표현한다. 
* nil이 할당 될수 있는지 없는지 표현한다. 

```

// someOptionalParm에 nil이 할당 될 수 있다.
func someFunction(someOptionalParam: Int?) {
// ....
}

/// someOptionalParm에 nil이 할당 될 수 없다.
func someFunction(someOptionalParam: Int) {
// ....
}

someFunction(someOptionalParam: nil)
// someFunction(someParam: nil) 

```


### 옵셔널을 쓰는 이유 

* nil의 가능성을 코드만으로 표현 가능하다. 
* 전달받은 값이 옵셔널이 아니라면 nil체크를 하지 않고 사용가능하다 
* 예외 상황을 최소화 할 수 있다.


### 옵셔널 문법
* enum + general
* 옵셔널 선언
* 옵셔널로 선언하면 nil을 할당할 수 있다.
```

enum Optional<Wrapped>: ExpressibleByNiliteral {
case none
case some(Wrapped)
}

let optionalValue: Optional<Int> = nil 
let optionalValue: Int? =nil // nil 이 할당될 수 있다. 

```

* 옵셔널 표현 

```
//////느낌표 (!)를 활용한 암시적 추출 옵셔널  // 런타임 오류가 발생할 수 있다. 

var implicitlyUnwrappedOptionalValue: Int! = 100

switch implicitlyUnwrappedOptionalValue {
case .none:
print("This Optional variable is nil")
case .some(let value):
print("Value is \(value)")
}

// 기존 변수처럼 사용 가능
implicitlyUnwrappedOptionalValue = implicitlyUnwrappedOptionalValue + 1

// nil 할당 가능
implicitlyUnwrappedOptionalValue = nil

// 잘못된 접근으로 인한 런타임 오류 발생 // 위의 구문에서 nil을 넣어주었는데 nil과 1을 더하려고 하니까 런타임 오류가 난다.
//implicitlyUnwrappedOptionalValue = implicitlyUnwrappedOptionalValue + 1


//////물음표(?)를 이용한 옵셔널 

// Optional
var optionalValue: Int? = 100

switch optionalValue {
case .none:
print("This Optional variable is nil")
case .some(let value):
print("Value is \(value)")
}

// nil 할당 가능
optionalValue = nil

// 기존 변수처럼 사용불가 - 옵셔널과 일반 값은 다른 타입이므로 연산불가
//optionalValue = optionalValue + 1

```

---

## 옵셔널 추출 

* 옵셔널의 추출 방식에는 크게 두가지가 있다. 
    * 안전하게 값을 꺼내 오는 방식 (옵셔널 바인딩)
    * 안에 값이 들었든 안들었든 강제적으로 추출하는 방식 ( ! )
    

### 옵셔널 바인딩

* if - let 방식 사용하기 

1. 옵셔널 바인딩은 옵셔널로 선언된 변수 안에 값이 들었는지 안들었는지 우선 체크를 한다. 
2. 체크를 하고 값이 있다면 let 으로 선언이된 임시 변수에 값을 담아 if문의 중괄호 내에서 안전하게 처리한다.
3. 만약 값이 없고 nil 값이라면 else 구문이 있는 경우에 else 구문에 해당하는 명령을 수행하게 된다. 
4. else 구문이 없다면 수행하지 않는다. 

```swift

// 옵셔널 타입의 변수 선언 
var name: String? = nil
var age: Int? = 24

if let name: String = name {
print(name)
}else{
print("nil 입니다.") // 값이 nil이기 때문에 else 구문의 명령 실행 
}
// 변수에 값 할당 
name = "SeongHwan"

type(of: name)// Optional<String>.Type

if let name: String = name {
print(name)// 값이 있기 때문에 임시 선언한 변수에 값을 담아와 사용한다. 
}
print(name) // "Optional("SeongHwan")\n"

// 한번에 여러 옵셔널 바인딩 하기 

//,를 이용해 여러 옵셔널을 바인딩 할 수 있다. 

if let name = name , let age = age {
print("Hi, my name is \(name). my age is \(age)")
}


```

### 강제추출 ( ! )

*  `!` 키워드로 옵셔널에 들어있는 값을 강제로 추출하는 방식 
* 만약 값이 없을경우 런타임 오류(crash) 가 발생해서 앱이 동작 도중 꺼져버린다. 

```swift

var name: String! = nil

print(name!) // error

```



---


## 구조체 ( struct ) 

* struct 키워드로 정의 가능 하다.
* class 와 유사하지만 struct 는 value  타입을 가진다. 


### 구조체 사용하기 
```swift

struct Test {

// 변수 선언
var something = 0
let name = "Seong Hwan"

// 인스턴스가 되었을때 쓰는 함수
func introduce(){
print("Hi I'm \(name)")
}

// 구조체 자체로 쓰는 함수
static func myAge(){
print("I'm 24)" )
}


}


Test.myAge()// 구조체 자체 함수 

var test = Test()
test.introduce() // 인스턴스 후에 쓰는 함수 


```

---


## 클래스 ( Class )

* class 키워드로 정의 가능하다.
* class 는 reference 타입이다. 
* 상속의 개념이 가능하다. 
* 다중상속이 되지않는다. 

### 클래스 사용하기 

1. 프로퍼티 
* init (초기화 메서드)
* stored property (저장 프로퍼티)
* Lazy stored proprety 
* Computed property ( 계산 프로퍼티)

2. 메서드 
* instanceMethod(인스턴스 메서드)
* staticMethod(스태틱 메서드)
* classMethod(클래스 메서드)



```swift

// 클래스 선언 
class sumeClass: 부모클래스이름 {
    //프로퍼티 선언부 
    let name = "SeongHwan"
    var num = 10 // stored property
    lazy var num1 = self.num // lazy property
    var add: Int{ return num + num1 } //Computed property



	//메서드 선언부 
    // 인스턴스 메서드 
    // 클래스를 인스턴스 시에 사용할 수 있다.
	func instanceMethod(){
		print("instanceMethod")
   	}
   	// 스태틱 메서드 
    // 클래스 자체를 호출해서 사용 가능한 메서드 이다. 
	static func staticMethod(){
		print("staticMethod")
   	}
    //클래스 메서드 
    // 클래스 내에서는 static 메서드와 동일 하다.
    // 클래스 메서드는 오버라이딩이 가능하다.
    class func classMethod(){
	print("classMethod")
    }
    
    




}




```






