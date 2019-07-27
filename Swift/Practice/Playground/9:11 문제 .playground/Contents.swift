//: Playground - noun: a place where people can play

import UIKit

//두 개의 정수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 출력하는 함수 (1, 5 입력 시 15 반환)

func inputIntreturnString(num1: Int,num2: Int) -> String{
    let result = String(num1) + String(num2)
    return result
}
inputIntreturnString(num1: 4, num2: 23)
//문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
func isSameString(str1: String, str2: String) -> Bool{
    if(str1 == str2){
        return true
    }else{
        return false
    }
}
isSameString(str1: "aaa", str2: "aaa")

//학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+,  4.0 = A, 3.5 = B+ ...)

func schoolScoreToRating(score: Double) -> String{
    switch score {
    case 4.5...5:
        return "A+"
    case 4.0..<4.5:
        return "A"
    case 3.5..<4.0:
        return "B+"
    case 3.0..<3.5:
        return "B"
    case 2.5..<3.0:
        return "C+"
    case 2.0..<2.5:
        return "C"
    case 0..<2.0:
        return "F"
    default:
        print("잘못된 입력입니다.")
        return "Wrong"
    }
}

schoolScoreToRating(score: 42)
//세 수를 입력받아 세 수의 곱이 양수이면 true , 음수이면 false 반환하는 함수  (switch - where clause 사용할 것)

func inputThreeNumbersIsPositiveOrNegative(num1: Double, num2: Double, num3: Double) -> Any{
    let total = (num1, num2, num3) // 튜플
    switch total {
    case let(x,y,z) where x * y * z >= 0 :
        return true
    case let(x,y,z) where x * y * z < 0  :
        return false
    default:
        print("잘못된 입력입니다.")
        return "wrong"
        }
        
    }

inputThreeNumbersIsPositiveOrNegative(num1: 0, num2: 3, num3: -3)
//특정한 달을 숫자로 입력 받아 문자로 반환해주는 함수 (1 = "Jan" , 2 = "Feb")
func monthNumReturnString(mon: Int) -> String{ // 미완성!
    switch(mon){
    case 1:
        return "Jan"
    case 2:
        return "Feb"
    case 3:
        return "Mar"
    case 4:
        return "Apr"
    case 5:
        return "May"
    case 6:
        return "Jun"
    case 7:
        return "July"
    case 8:
        return "Aug"
    case 9:
        return "Sep"
    case 10:
        return "Oct"
    case 11:
        return "Nov"
    case 12:
        return "Dec"
    default:
        print("잘못된 입력입니다. 1부터 12까지만 입력해주세요 ")
        return "wrong"
    }
}
monthNumReturnString(mon: 1)
//윤년 구하기 (2월 29일이 있는 해.  매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)
func returnIsLeapYear(year: Int) -> Bool{
    switch year{
    case let x where x % 4 == 0:
        return true
    case let x where x % 100 == 0:
        return true
    default:
        return false
    }
    
}
returnIsLeapYear(year: 2016)

//for 문을 이용하여 3 의 10 제곱에 대한 결과값을 표현하는 코드 구현
var num = 3
var result = 1
for _ in 1...10{
    result *= num
}
print(result)

//for 문을 이용하여 10부터 1까지 내림차순으로 출력하는 코드 구현
var num1 = 10
for i in (1...10).reversed(){
    print(i)
    
}



//for , while , repeat - while 등을 골고루 활용하여 아래 문제들을 구현해보세요.
//
//1 ~ 9 사이의 숫자를 입력받아 해당 숫자에 해당하는 구구단의 내용을 출력하는 함수

func printMulticationTable(num: Int){
    switch num{
    case 1...9:
        for var i in 1...9{
            print("\(num) x \(i) = \(num * i)" )
            i += 1
        }
    default:
        print("1부터 9 까지만 입력해주세요")
    }
}
printMulticationTable(num: 8)
//정수 하나를 입력받아 그 수의 Factorial 을 구하는 함수

func returnFactorial(num: Int) ->Int{
    var result = 1
    var num1 = num

    for _ in 1...num{
        result *= num1
        num1 -= 1
    }
    return result
}
returnFactorial(num: 4)
//정수 두개를 입력받아 첫 번째 수를 두 번째 수의 횟수만큼 곱한 값을 반환하는 함수
func  returnToTheNthPowerOfSecondNumder(num1: Int, num2: Int) -> Int{
    var num = num1
    for _ in 1..<num2{
        num *= num1
    }
    return num
}
returnToTheNthPowerOfSecondNumder(num1: 5, num2: 2)
//정수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수

    //10으로 나눠서 나머지 끼리 더하기
func returnSumDigitNumber(num: Int) -> Int{
    var num1: Int = num
    var result = 0
    var j: Int
    while num1 > 0 {
        j = num1 % 10
        result += j
        num1 = num1 / 10
        if num1 == 0{
            break
        }
    }
    return result
}

returnSumDigitNumber(num: 233)
//100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
func printCommonMultiple(){
    for number in 1...100{
        switch number{
        case number where number % 15 == 0:
                print(number)
        default:
            break
        }
    }
    }

printCommonMultiple()

//    - 정수 하나를 입력받아 그 정수의 약수를 모두 출력하는 함수
func printDivisor(num : Int) -> [Int]{
    var divisor = [Int]()
    for var i in 1...num{
        if num % i == 0{
            print(i)
            divisor.append(i)
        }
        i += 1
    }
    print(divisor)
    return divisor
}
printDivisor(num: 13)
//        - 2 이상의 정수를 입력받아, 소수인지 아닌지를 판별하는 함수
func isPrimeNumber(num: Int) -> String{
    switch num {
    case _ where num < 2:
        return "2 이상의 숫자를 넣어주세요"
    case 2...:
        if(printDivisor(num: num).count == 2)
        {
            return "소수입니다."
        }else{
            return "소수가 아닙니다."
        }
    default:
        print("잘못된 입력입니다.")
        return "잘못된 입력입니다."
    }
}
isPrimeNumber(num: 2777)
//- 정수를 입력받아 입력받은 수에 해당하는 자리의 피보나치 숫자를 반환하는 함수
func isFibonacciNum(num: Int) -> Int{
    var fibo = 1
    var num1 = 0
    var num2 = 0
    for _ in 1...num - 2{
        num1 = fibo + num2
        num2 = fibo
        fibo = num1
    }
    return fibo

}
//피보나치 완성
isFibonacciNum(num: 5)





