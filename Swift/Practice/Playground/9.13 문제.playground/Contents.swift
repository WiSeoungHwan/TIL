//: Playground - noun: a place where people can play

import UIKit


enum Month{
    case jan
    case feb (Int)
}

var month = Month.feb(2020)
switch month {
case .jan :
    print("1월 입니다.")
case let .feb (year) :
    if year % 4 == 0 && year % 100 != 0{
        print("윤년 입니다")
    }else {
        print("윤년이 아닙니다.")
    }

}

// on 과 off 값을 가진 enum 타입 RemoteControl 에 호출 시마다 on, off 값을 바꿔줄 수 있는 함수 구현
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

var remoteControl = RemoteControl.on

remoteControl.changeValue()
remoteControl.changeValue()
remoteControl.changeValue()


//각 케이스별로 연산을 수행하고 그 값을 반환하는 evalue 함수 구현

indirect enum ArithmeticExpression { // 자기자신을 타입으로 쓰는 것은 indirect 키워드를 꼭 붙여줘야함
    case number(Int)// 정수를 받는 케이스
    case addition(ArithmeticExpression, ArithmeticExpression) // 덧셈할 값을 저장하는 케이스
    case multiplication(ArithmeticExpression, ArithmeticExpression)// 곱셈할 값을 저장하는 케이스
}

func evaluate(_ expression: ArithmeticExpression) -> Int {// 위의 enum을 매개변수로 받고 반환할떄는 꼭 Int 타입으로 반환해야된다. 위의 enum 타입 아님
    switch expression {//매개 변수를 기준으로 숫자만 받았는지 덧셈케이스로 받았는지 곱셈케이스로 받았는지
    case .number(let value):// 숫자를 받았을때 정수형으로 반환을 한다.
        return value
    case .addition(let num1, let num2):// 두 숫자를 덧셈한다
        return evaluate(num1) + evaluate(num2)//자기 자신을 다시 호출한다. 왜냐하면 숫자를 받았을 때 정수타입이 아니라    위의 enum의 타입이기 때문에 정수로 꺼내 줘야함 그리고 정수타입으로 바꾼후 더하고 리턴한다.
    case .multiplication(let expression1, let expression2):
        return evaluate(expression1) * evaluate(expression2)// 곱셈도 덧셈과 같다
    }
}


let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(five, four)

evaluate(sum)
evaluate(product)

/***************************************************
 celcius, fahrenheit, kelvin 온도 3가지 케이스를 가진 Temperature enum 타입을 정의
 각 케이스에는 Double 타입의 Associated Value 를 받도록 함
 각 온도를 섭씨 온도로 변환해주는 toCelcius() 함수를 구현
 섭씨 = (화씨 - 32) * 5 / 9
 섭씨 = 켈빈 + 273
 ***************************************************/

enum Temperature {
    case celcius(Double), fahrenheit(Double), kelvin(Double)
    
    func toCelcius() -> Double{
        switch self {
        case .celcius(let temperature):
            return temperature
        case .fahrenheit(let temperature):
            return (temperature - 32) * 5 / 9
        case .kelvin(let temperature):
            return temperature + 273
        }
    }
}

var f = Temperature.fahrenheit(90)
f.toCelcius()

//1.
//자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
//ex) 123 -> 321 , 10293 -> 39201

func changeNum(_ num : UInt) -> UInt? {
    let tsStr = String(num)
    let arySty = tsStr.reversed()
    let finalStr = String(arySty)
    
    return UInt(finalStr)
}
changeNum(923)





//2.
//2개의 자연수와 사칙연산(+, -, *, /) 값을 가진 하나의 enum 타입을 입력받아 해당 연산을 수행하는 함수
indirect enum Arithmetic {
    case number(UInt)
    case addition(Arithmetic,Arithmetic), subtraction(Arithmetic,Arithmetic), multiplication(Arithmetic,Arithmetic), division(Arithmetic,Arithmetic)
}
func calculator (_ num: Arithmetic) -> UInt{
    switch num {
    case .number(let value):
        return value
    case .addition(let num1, let num2):
        return calculator(num1) + calculator(num2)
    case .subtraction(let num1, let num2):
        return calculator(num1) - calculator(num2)
    case .multiplication(let num1, let num2):
        return calculator(num1) * calculator(num2)
    case .division(let num1, let num2):
        return calculator(num1) / calculator(num2)
    }
}




//3.
//정수 타입의 배열을 선언하고 해당 배열 요소 중 가장 큰 값을 반환하는 함수 만들기
//ex) [50, 23, 29, 1, 45, 39, 59, 19, 15] -> 59

func bigNum(_ num : UInt) -> UInt{
    let tsStr = String(num)
    let sorStr = tsStr.sorted()
    let arySty = sorStr.reversed()
    let finalStr = String(arySty)
    
    return UInt(finalStr)!
}


//4.
//정수 타입의 배열을 2개 선언하고 겹치는 숫자들로 만들어진 배열을 반환하는 함수
//ex) [1, 2, 4, 8, 9, 12, 13] , [2, 5, 6, 9, 13]  -->  [2, 9, 13]
