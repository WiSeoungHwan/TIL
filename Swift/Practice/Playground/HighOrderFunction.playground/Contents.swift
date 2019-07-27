import UIKit

//struct Pet {
//    enum PetType {
//        case dog, cat, snake, pig, bird
//    }
//    var type: PetType
//    var age: Int
//}
//let myPet = [ Pet(type: .dog, age: 13),
//              Pet(type: .dog, age: 2),
//              Pet(type: .dog, age: 7),
//              Pet(type: .cat, age: 9),
//              Pet(type: .snake, age: 4),
//              Pet(type: .pig, age: 5),
//            ]
//
//func sum () -> Int{
//    var result = 0
//    for i in myPet{
//        result += i.age
//    }
//    return result
//}
//
//sum()
//
//func newAge(){
//    for var i in myPet{
//        i.age += 1
//        print(i.age)
//    }
//}
//newAge()
//
//
//func sum2() -> Int{
//    return myPet.filter{ $0.type == .dog}.reduce(0) {$0 + $1.age}
//}


//let immutableArray = Array(1...40)
//
//func multiIndex() -> [Int]{
//    var result: [Int] = []
//    for (index, num) in immutableArray.enumerated(){ // 인덱스 출력하는 방법
//         result.append(index * num)
//    }
//    return result
//}
//
//func isEvenNumberSum(multiIndex: () -> [Int]) -> Int{
//    var multi = multiIndex()
//    print(multi)
//    var result = 0
//    for i in multi {
//        guard i % 2 == 0 else {continue}
//        result += i
//    }
//    return result
//}
//
//var num = isEvenNumberSum(multiIndex: multiIndex)
//
//print(num)
//
//
//
//func isEvenNumberAllSum(){
//    var multiNum = immutableArray.enumerated().map {
//        $0 * $1}.reduce(0) {$0 + $1}
//
//    print(multiNum)
//}
//isEvenNumberAllSum()

//let array = ["1j","2d", "22", "33"]
//let m1 = array.map({Int($0)})
//let f1 = array.compactMap({Int($0)})
//let m2 = array.map({Int($0)}).first
//let f2 = array.compactMap({Int($0)}).first


let array: [[Int?]] = [[1,2,3], [nil, 5], [6,nil], [nil, nil]]

print(array.map{$0})

print(array.map{ $0.compactMap{$0}})

print(array.compactMap({$0}))



