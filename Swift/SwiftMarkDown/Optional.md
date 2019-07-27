#  Optional

---
## Optional
            
* Optional의 가장 큰 장점은 nil에 접근하는 것을 막아 app이 runtime 도중에 크래시가 나는 것을 막아주는 것이다. 
* Optional은 nil 이 있냐 ,없냐의 여부를 말한다. 
* Optional은 enum으로 이루어져 있다. 
                   
---



## 선언 방법

* 옵셔널을 선언방법은 다음과 같다. 
    
```swift

// 타입뒤에 ?를 붙이거나 Optional이라는 키워드를 붙인다. 
var optionalValue : Int? // 이 방법이 많이 쓰이는 방법이다. 
var optionalValue1: Optional<Int>

```

---

## Optional의 사용이유 

* 옵셔널은 nil 있거나 값이 있거나 를 가르킨다고 했는데  여기서 `nil` 은 값이 없음을 뜻한다. 
    일반적인 변수에는 nil이 할당되지 않으나 옵셔널 타입인 경우에는 할당이 가능하다. 
    

```swift

//일반 변수는 nil 값을 받을 수없다.
//var optional: Int = nil // error
var optional: Int? = nil // No error

```


---

## Optional의 사용 방법 

* 옵셔널의 사용방법 또한 일반 변수와는 다르다. 
    * 옵셔널로 변수를 선언 하게되면 옵셔널 타입으로 타입이 바뀌기때문에 일반 변수처럼 자유롭게 쓸수 없다.
    * ?기호를 붙여준 것이 변수에 nil 이 들어올 수 있다고 가능성을 열어놓았기 때문에 nil이 들어왔을 경우의
          대응이 미리 있어야 한다. 
* 사용 방법에는 몇가지가 있다. 
          
          

###  If를 사용하는 방법 

* if를 사용해서 nil 이 아님을 체크 할 수 있다. 
        
```swift

optional = 1 // 값을 할당해주었다. 따라서 nil이 아니다. 

if optional != nil{
//something
print(optional)// "Optional(1)\n"
}
```


* 위의 상황에서는 출력 결과가 "Optional(1)\n" 이라고 출력되는데 이유는 다음과 같다.
    * 변수 optional은 Int?로 선언되었기 때문에 완전한 정수 타입이 아니라 optionalInt타입이다.
    * optional 변수로 선언된 변수의 값을 제대로 꺼내오기 위해서는 여러 방법이 있다. 

    1. `!` 키워드 사용하기 
        *   `!`  는 이 변수는 반드시 값이 들어있다 라는 메세지를 컴파일러에게 해주는 것과 같다. 
        * 따라서 반드시 값이 존재하는 상황에서 사용해야한다. 

```swift
// 수정된 코드 ! 사용
optional =1

if optional != nil{
//something
print(optional!)// "1"
}
// print 문으로 사용할때 !를 붙여주었다. 

```


### Optional Binding 

* 옵셔널 바인딩은 !를 사용하지 않고 옵셔널을 안전하게 꺼낼 수 있는 방식 이다. 
    * 주로 if let 을 사용하고 guard문으로도 사용이 가능하다. 
    * ?? 키워드로 간단하게 nil 값에 대한 경우를 대비할 수있다. 
        
```swift
// 변수 optional의 값을 someValue에 꺼내와서 if문 안에서 활용을 하기때문에 안전하다. 
if let someVelue = optional{
print(someVelue)
}else{
print("nil")
}
// ?? 키워드의 활용 
var num1 = optional ?? 0 // 삼항연산자와 비슷하나 nil 값의 여부에 따라 작동한다. 
print(num1)// "1"

// if var 로도 가능 하다.
```



### Implicitly Unwrapped Optionals

* 명시적으로 옵셔널 타입을 정하고 쓸수도 있다.
        
```swift

//값이 있음을 확정을 하고 쓰는 것  옵셔널타입이지만 반드시 값이 있어야하는 옵셔널 타입
let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString


if assumedString != nil {
print(assumedString!)
}

if let definiteString = assumedString {
print(definiteString)
}


/***************************************************
- 추후 어느 순간에서라도 nil 이 될 수 있는 경우에는 이 것을 사용하지 말아야 함
- nil value 를 체크해야 할 일이 생길 경우는 일반적인 옵셔널 타입 사용
***************************************************/
```


### OptionalChaning 정리 필요 

