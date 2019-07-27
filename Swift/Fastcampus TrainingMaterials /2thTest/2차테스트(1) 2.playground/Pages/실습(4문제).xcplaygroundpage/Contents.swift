import Foundation

/***************************************************
 < 1번 문제 >
 손님, 바리스타, 커피 클래스를 각각 정의하고
 손님이 바리스타에게 커피를 주문하는 기능 구현하기
 
 [ Class ]
 ** 손님 (Customer)
 - 필수 속성: 이름(name)
 - 필수 메서드: 주문하기( func order(menu: CoffeeMenu, to: Barista) )
 
 ** 바리스타 (Barista)
 - 필수 속성: 이름(name)
 - 필수 메서드: 커피 만들기( func makeCoffee(menu: CoffeeMenu) -> Coffee )
 
 ** 커피 (Coffee)
 - 필수 속성: 이름(name), 가격(price)
 
 [ Enumeration ]
 ** 커피 메뉴 (CoffeeMenu)
 - case: americano, latte, cappuccino
 
 e.g.
 let customer = Customer(name: "손님A")
 let barista = Barista(name: "바리스타A")
 customer.order(menu: .americano, to: barista)
 
 Output: 손님A이(가) 바리스타A에게 2000원짜리 Americano을(를) 주문하였습니다.
 ***************************************************/

print("\n---------- [ 1번 문제 ] ----------\n")

class Customer{
    var name = ""
    init(name: String) {
        self.name = name
    }
    func order(menu: CoffeeMenu, to: Barista){
        print("\(name)이(가) \(to)에게 \(menu.rawValue)원 짜리 \(menu)을(를) 주문하였습니다")
        var coffee = to.makeCoffee(order: menu)
    }
}

enum CoffeeMenu: String{
    case americano = "2000"
    case latte = "3000"
    case cappuccino = "3500"
}

class Barista{
    var name: String?
    
    init(name: String) {
        self.name = name
    }
    func makeCoffee(order: CoffeeMenu) -> Coffee{
        print("\(name ?? "바리스타"): 주문하신 \(order.rawValue)원 짜리 \(order)이(가) 나왔습니다.")
        return Coffee(name: order, price: order.rawValue)
    }
}

class Coffee {
    var name: CoffeeMenu?
    var price: CoffeeMenu.RawValue?
    init(name: CoffeeMenu, price: CoffeeMenu.RawValue) {
        self.name = name
        self.price = price
    }
}

    
let customer = Customer(name: "손님A")
let barista = Barista(name: "A바리스타")
customer.order(menu: .americano, to: barista)



/***************************************************
 < 2번, 3번 문제 >
 주어진 숫자에 대해 10의 숫자 단위로 그룹으로 묶고, 각 그룹의 데이터는 해당 범위 내의 숫자들로 구성
 
 2번 문제: 위 내용을 Dictionary를 이용해 구현하기
 3번 문제: 위 내용을 Array를 이용해 구현하기
 
 Input 1: Array(1...100)
 Input 2: [0, 3, 9, 15, 27, 33, 41, 49, 90, 98]
 
 Output: 아래와 동일한 형식으로 출력하며, 그룹의 숫자는 오름차순으로 출력되어야 함.
 
 e.g.
 1) Input 1 일 때
 Group: 0  -  Value: [1, 2, 3, 4, 5, 6, 7, 8, 9]
 Group: 1  -  Value: [10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
 ....
 Group: 10  -  Value: [100]
 
 2) Input 2 일 때 - Value가 없는 그룹은 표현하지 않아야 함
 Group: 0  -  Value: [0, 3, 9]
 ...
 Group: 4  -  Value: [41, 49]
 Group: 9  -  Value: [90, 98]
 ***************************************************/

let data1 = Array(1...100)
let data2 = [0, 3, 9, 15, 27, 33, 41, 49, 90, 98]

/***************************************************
 2번 문제 - Dictionary를 이용해서 구현
 ***************************************************/

print("\n---------- [ 2번 문제 ] ----------\n")

func dataSortDictionary(data: [Int]){
    var arr = data.sorted()
    var resultDictionary = [String: [Int]]()
    var group = 0
    for i in arr {
        group = i / 10
        resultDictionary.updateValue([Int](), forKey: "\(group)")
    }
    for i in arr {
        group = i / 10
        resultDictionary["\(group)"]?.append(i)
    }
    print(resultDictionary)
}

dataSortDictionary(data: data2)


/***************************************************
 3번 문제 - Array를 이용해서 구현
 ***************************************************/

print("\n---------- [ 3번 문제 ] ----------\n")

func dataSortArr(data: [Int]){
    var arr = data.sorted()
    var arrRange = (arr.last!) / 10
    var resultArr = [[Int]](repeating: [Int](), count: arrRange + 1)
    for i in arr {
        var group = i / 10
        resultArr[group].append(i)
    }
    arrRange = 0
    for i in resultArr {
        print("Group\(arrRange):  \(i)")
        arrRange += 1
    }
}


dataSortArr(data: data2)


/***************************************************
 < 4번 문제 >
 고차함수만을 이용하여 구현
 
 1) 하
 1부터 100까지의 숫자를 가진 배열에서 홀수만을 골라 각 숫자에 1씩 더해준 배열을 출력
 Output: [2, 4, 6, 8, 10, 12, ... 98, 100]
 
 2) 중
 ["1", "2", "3", "4", "5", "A", "B", "C", "D"]
 위 배열에서 숫자에 해당하는 문자열만 골라낸 뒤, 그것을 제곱한 숫자들을 모두 더한 결과 출력
 Output: 55
 
 3) 상
 let users = [("M", "Andew"), ("M", "Eric"), ("W", "Christina"), ("W", "Anna")]
 let personalities = ["Kind", "Funny", "Sensitive", "Gloomy"]
 위와 같은 배열이 있을 때 여자(W)만을 대상으로 성격을 나타내는 personalities 배열 중
 하나의 속성이 랜덤하게 이름 앞에 붙어 반환되도록 구현
 [ 참고사항 ]
 이 문제에 한해서 클로저 내에서 Intput, Otuput에 대한 타입을 명시해주지 않으면
 컴파일러의 한계로 오류가 생길 수 있으니 Type Inference 대신 Type Annotation 방식 이용
 
 Output 예시: ["Kind Christina", "Gloomy Anna"]
 ***************************************************/

print("\n---------- [ 4번 문제 ] ----------\n")

//1)
print("1)")

var oneArr = 1...100

// map 기존의 배열은 변경되지 않고 새로운 배열을 반환함
// $0은 배열안의 요소
var oneArr2 = oneArr.map {$0 + 1}
print(oneArr2)

//2)
print("2)")

var twoArr =  ["1", "2", "3", "4", "5", "A", "B", "C", "D"]

var twoArr2 = twoArr.map{Int($0)}.compactMap{$0}.reduce(0){($1 * $1) + $0 }

print(twoArr2)

//3)
print("3)")

let users = [("M", "Andew"), ("M", "Eric"), ("W", "Christina"), ("W", "Anna")]
let personalities = ["Kind", "Funny", "Sensitive", "Gloomy"]

var resultArr: [String] = users.filter{$0.0 == "W"}.map{"\(personalities.randomElement()!) \($0.1)"}.compactMap{$0}

print(resultArr)
/***************************************************
 수고하셨습니다!
 ***************************************************/



