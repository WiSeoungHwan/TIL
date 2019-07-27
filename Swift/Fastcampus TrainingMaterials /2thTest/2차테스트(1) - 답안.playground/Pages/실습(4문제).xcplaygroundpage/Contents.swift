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

class Customer {
  let name: String
  init(name: String) {
    self.name = name
  }
  
  func order(menu: CoffeeMenu, to barista: Barista) {
    let coffee = barista.makeCoffee(menu: menu)
    print("\(name)이(가) \(barista.name)에게 \(coffee.price)원짜리 \(coffee.name)을(를) 주문하였습니다.")
  }
}

class Barista {
  let name: String
  init(name: String) {
    self.name = name
  }
  
  func makeCoffee(menu: CoffeeMenu) -> Coffee {
    let price: Int
    switch menu {
    case .americano: price = 2000
    case .latte: price = 2500
    case .cappuccino: price = 3000
    }
    return Coffee(name: menu.rawValue, price: price)
  }
}


enum CoffeeMenu: String {
  case americano = "Americano"
  case latte = "Latte"
  case cappuccino = "Cappuccino"
}

class Coffee {
  let name: String
  let price: Int
  init(name: String, price: Int) {
    self.name = name
    self.price = price
  }
}

let customer = Customer(name: "손님A")
let barista = Barista(name: "바리스타A")
customer.order(menu: .americano, to: barista)
// 손님A이(가) 바리스타A에게 2000원짜리 Americano을(를) 주문하였습니다.



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
 2번. Dictionary를 이용한 형태
 ***************************************************/

print("\n---------- [ 2번 문제 ] ----------\n")

func sortOut(numbers: [Int]) -> [Int: [Int]] {
  var groupDict: [Int: [Int]] = [:]
  
  for i in numbers {
    if let _ = groupDict[i / 10] {
      groupDict[i / 10]?.append(i)
    } else {
      groupDict[i / 10] = [i]
    }
  }
  return groupDict
}

let groupDict = sortOut(numbers: data2)
let sortedGroups = groupDict.keys.sorted()
for group in sortedGroups {
  print("Group: \(group)  -  Value: \(groupDict[group]!)")
}





/***************************************************
 3번. Array를 이용한 형태
 ***************************************************/

print("\n---------- [ 3번 문제 ] ----------\n")

func sortOutNumbers(_ numbers: [Int]) -> [[Int]] {
  var groups: [[Int]] = []
  
  for number in numbers {
    let quotient = number / 10
    let diffCount = quotient - groups.count

    if diffCount >= 0 {
      (0...diffCount).forEach { _ in groups.append([]) }
    }
    groups[quotient].append(number)
  }
  return groups
}


let numbers = sortOutNumbers(data2)
for (idx, group) in numbers.enumerated() {
  guard !group.isEmpty else { continue }
  print("Group: \(idx)  -  Value: \(group)")
}




/***************************************************
 < 4번 문제 > 고차함수만을 이용하여 구현
 1)
 1부터 100까지의 숫자를 가진 배열에서 홀수만을 골라 각 숫자에 1씩 더해준 배열을 출력
 Output: [2, 4, 6, 8, 10, 12, ... 98, 100]
 
 2)
 ["1", "2", "3", "4", "5", "A", "B", "C", "D"]
 위 배열에서 숫자에 해당하는 문자열만 골라낸 뒤, 그것을 제곱한 숫자들을 모두 더한 결과 출력
 Output: 55
 
 3)
 let users = [("M", "Andew"), ("M", "Eric"), ("W", "Christina"), ("W", "Anna")]
 let personalities = ["Kind", "Funny", "Sensitive", "Gloomy"]
 위와 같은 배열이 있을 때 여자(W)만을 대상으로 성격을 나타내는 personalities 배열 중
 하나의 속성이 랜덤하게 이름 앞에 붙어 반환되도록 구현
 
 Output 예시: ["Kind Christina", "Gloomy Anna"]
 ***************************************************/

print("\n---------- [ 4번 문제 ] ----------\n")

// 1)
let oneToHundred = Array(1...100)
let result4_1 = oneToHundred
  .filter { !$0.isMultiple(of: 2) }
  .map { $0 + 1 }
print(result4_1)


// 2)
let strings = ["1", "2", "3", "4", "5", "A", "B", "C", "D"]
let result4_2 = strings
  .compactMap(Int.init)
  .map { $0 * $0 }
  .reduce(0, +)
print(result4_2)

// 3)
let users = [("M", "James"), ("M", "Terry"), ("W", "Liana"), ("W", "Anna")]
let personalities = ["Kind", "Funny", "Sensitive", "Gloomy"]

let result4_3 = users
  .filter ({ $0.0 == "W" })
  .map { "\(personalities.randomElement()!) \($0.1)" }
print(result4_3)
/***************************************************
 수고하셨습니다!
 ***************************************************/



