import UIKit

var input = [5, 33, 1, 11, 10, 2, 7, 14, 9]


//var a = 0
//var b = 0
//// selection sort
//
//for i in 0...input.count - 1{
//    for j in 0...input.count - 1 {
//        a = input[i]
//        b = input[j]
//        if a < b{
//            input[j] = a
//            input[i] = b
//        }
//
//    }
//    print(input)
//}
//
//print(" selection sort \(input)")

//buble sort

//var c = 0
//var d = 0
//
//for i in 0...input.count - 1{
//    var isSorted = true
//    for j in 1...input.count - 1{
//        c = input[j - 1]
//        d = input[j]
//        if c > d{
//            input[j] = c
//            input[j - 1] = d
//            isSorted = false
//        }
//    }
//    print(input)
//    guard !isSorted else {break}
//}
//
//
//
//print("BubleSort \(input)")

//insection sort
//var save = 0
//for i in input{
//    for j in 1...input.count - 1{
//        if input[j] < input[j - 1] {
//            save = input[j - 1]
//            input[j - 1] = input[j]
//            input[j] = save
//            print(input)
//        }
//    }
//}
var save = 0
for i in 0...input.count - 1{
    var isSorted = true
    for j in 1...input.count - 1{
        save = input[j]
        while save < input[j - 1] {
            input[j] = input[j - 1]
            input[j - 1] = save
            isSorted = false
        }
    }
    print(input)
    guard !isSorted else {break}
}
print("insertion sort \(input)")
