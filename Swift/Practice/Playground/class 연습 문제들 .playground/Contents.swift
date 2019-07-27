//: Playground - noun: a place where people can play

import UIKit

/***************************************************
 1. width, height 속성을 가진 Quadrangle 클래스 정의
 2. 초기화 메서드에서 width, height 프로퍼티 값을 설정할 수 있도록 구현
 3. 사각형의 가로 세로 길이를 설정할 수 있는 메서드 구현
 4. 사각형의 가로세로 길이  /  사각형의 넓이를 반환하는 메서드를 각각 구현
 5. 다음과 같은 속성을 지닌 인스턴스 생성
 
 - 직사각형 1개 속성: width = 10, height = 5
 - 정사각형 1개 속성: width = 7, height = 7
 ***************************************************/

class Quadrangle {
    var width: Double
    var height: Double
    
    init(_ width: Double, _ height: Double) {
        self.width = width
        self.height = height
    }
    
    func settingWidHei(width: Double, height: Double){
        self.width = width
        self.height = height
    }
    
    func currentStatus(Status: String) -> String{
        switch Status {
        case "Length":
            return "width: \(width), height: \(height)"
        case "Area":
            return "area: \(width * height)"
        default:
            return "Only choies length and Area"
        }
    }
}
var Quad1 = Quadrangle(10,5)
Quad1.currentStatus(Status: "Length")
var Quad2 = Quadrangle(7,5)


/***************************************************
 1. 채널 정보, Volume 값, 전원 설정여부를 속성으로 가지는 클래스 정의
 2. TV 의 현재 채널 및 볼륨을 확인할 수 있는 메서드 및 변경 가능한 메서드 구현
 3. TV 전원이 꺼져있을 때는 채널과 볼륨 변경을 할 수 없도록 구현
 4. TV 전원이 꺼져있을 때는 채널과 볼륨 정보를 확인했을 때 -1 이 반환되도록 구현
 ***************************************************/

class TV {
    var chanal: Int
    var volume: Int
    var power: Bool
    
    init() {
        power = false
        chanal = 0
        volume = 0
    }
    func powerOnOff(toggle: Bool){
        if power == true{
            power = false
        }else{
            power = true
        }
    }
    func controlChVolume(ch: Int , vol: Int) -> String {
        self.chanal = ch
        self.volume = vol
        guard power else {return "CH: \(self.chanal - 1), Vol: \(self.volume - 1)"}
        return "Curent CH: \(self.chanal), Vol: \(self.volume)"
    }
    
}

var tv = TV()
tv.controlChVolume(ch: 4, vol: 45)

/***************************************************
 1. 사각형의 길이를 설정하는 초기화 메서드, 둘레와 넓이값을 구하는 메서드 구현
 2. 원의 반지름을 설정하는 초기화 메서드, 둘레와 넓이값을 구하는 메서드 구현
 ***************************************************/

class Square {
    var width: Double
    var height: Double
    
    init(width: Double,height: Double) {
        self.width = width
        self.height = height
    }
    
    func perimeter(width: Double, height: Double) -> Double{
        return (width * 2) + (height * 2)
    }
    func area(width: Double, height: Double) -> Double {
        return width * height
    }
}


class Circle {
    let pi = Double.pi
    var radius : Double
    init(radius: Double) {
        self.radius = radius
    }
    
    func getPerimeter() -> Double{
        return radius * 2 * pi
    }
    func getArea() -> Double {
        return radius * radius * pi
    }
    
    
}

//1. 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.

//    ** 강아지 (Dog)
//    - 속성: 이름, 나이, 몸무게, 견종
//- 행위: 짖기, 먹기

class Dog {
    var name: String!
    var age: Int!
    var weight: Double!
    var breed: String!
    
    func Bowow(){
        print("Bowow")
    }
    func eat(){
        print("yamyam")
    }
}


//
//** 학생 (Student)
//- 속성: 이름, 나이, 학교명, 학년
//- 행위: 공부하기, 먹기, 잠자기

class Student{
    var name: String!
    var age: Int!
    var schoolName: String!
    var schoolYear: Int!
    
    func study(){
        print("study")
    }
    func eat(){
        print("yamyam")
    }
    func sleep(){
        print("zz")
    }
}
//
//** 아이폰(IPhone)
//- 속성: 기기명, 가격, faceID 기능 여부(Bool)
//- 행위: 전화 걸기, 문자 전송

class Iphone{
    var deviceName: String
    var price: Int
    var useFaceID: Bool
    
    init(deviceName: String, price: Int, useFaceID: Bool) {
        self.deviceName = deviceName
        self.price = price
        self.useFaceID = useFaceID
    }
    
    func call() {
        print("calling")
    }
    func sendText(){
        print("sending Text")
    }
}
//
//** 커피(Coffee)
//- 속성: 이름, 가격, 원두 원산지
class Coffee{
    var name: String
    var price: Int
    var origin: String
    
    init (name: String, price: Int, origin: String){
        self.name = name
        self.price = price
        self.origin = origin
    }
}


//2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기

//** 계산기 (Calculator)
//- 속성: 현재 값
//- 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
class Calculator{
    var curValue: Double = 0
    
    
    func add(_ num: Double) -> Double{
        curValue += num
        return curValue
    }
    func subtract(_ num: Double) -> Double{
        curValue -= num
//        guard curValue <= 0 else{return 0} // 왜 0이 나올까 
        return curValue
    }
    func multiply(_ num: Double) -> Double{
        curValue *= num
        return curValue
    }
    func divide(_ num: Double) -> Double{
        curValue /= num
        return curValue
    }
    func reset() -> Double{
        curValue = 0
        return curValue
    }
    
}

let calculator = Calculator() // 객체생성

calculator.curValue  // 0
calculator.add(10)    // 10
calculator.add(5)     // 15

calculator.subtract(9)  // 6
calculator.subtract(10) // -4

calculator.multiply(4)   // -16
calculator.multiply(-10) // 160

calculator.divide(10)   // 16
calculator.reset()      // 0




 
