#  Enumeration 

* 열거형 
    * 연관된 값들을 묶어 공통으로 정의하고 type 에 맞춰 해당 값들을 사용 가능하다. 
    * 열거형 자체가 하나의 타입으로 정의 된다. 
    
    ---
    

## enum 선언 

* enum을 선언하고 타입을 정해줄 수도 있다. 
* 각 케이스는 case 키워드를 사용해서 선언가능하다 
* 한줄에 `,` 를 사용해서 여러개 선언 가능하다. 
* case에 대한 rawValue 값을 정해줄 수 있다. 하지만 자동으로 정수값이 부여되지 않는다. 

```swift

//enum

//enum Compasspoint {
//    case north
//    case south
//    case west, east// ,로 case를 여러개 만들 수 있다.
//}

enum Compasspoint: Int{// rawValue를 지정할때는 타입을 명시 해줘야함 
case north
case south = 1 // rawValue 지정가능
case west, east// 뒤의 값들은 그 다음 케이스 부터 자동으로 rawValue가  순차적으로 들어간다.
}


```
---

## enum 사용 

* enum 을 변수에 할당해서 사용할 수 있다. 

1. switch 문을 활용한 활용법 


```swift

let compasspoint = Compasspoint.north // 변수나 상수에  케이스를 정해서 넣을 수있다. 

switch compasspoint{// 선언된 변수에 담긴 case에 따라 
case .north:
print("North")
case .south:
print("South")
case .west :
print("West")
case .east :
print("East")
}


```


2.  함수를 넣어 사용하는 방법


```swift 

enum Compasspoint: Int{
case north
case south = 1 // rawValue 지정가능
case west, east// 뒤의 값들은 자동으로 rawValue가  순차적으로 들어간다.


func printCompasspoint(){

switch self{// 함수 안에서 자기 자신의 타입을 판단해 처리한다. 
case .north:
print("North")
case .south:
print("South")
case .west :
print("West")
case .east :
print("East")
}
}
}

Compasspoint.east.printCompasspoint() // "East"


```


---

## Mutating 

* enum 타입 내부 함수에서 자기 자신의 값을 변경해야 할 경우 mutating 키워드 필요 
* 함수 앞에 mutating을 붙인다. 


```swift

enum RemoteControl {
case on, off
mutating func changeValue(){
if(self == .off){
self = .on
}else{
self = .off
}
}
}

var remoteControl = RemoteControl.on// on 

remoteControl.changeValue()// off
```

