//
//  main.swift
//  AlgorithmsMemo
//
//  Created by Wi on 23/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation

func solution1(_ answers: [Int]) -> [Int]{
    var giveUpMathHumans = [(1,0),(2,0),(3,0)]
    
    // 1,2,3,4,5,1,2,3...
    for i in 1...5{
        if answers[i - 1] == i {
            giveUpMathHumans[0].1 += 1
        }
    }
    // 2,1,2,3,2,4,2,5
    var two = (2,1)
    for (i, v) in answers.enumerated(){
        if i % 2 == 0 {
            if two.0 == v{
                giveUpMathHumans[1].1 += 1
                print("%2 == 0", v)
            }
        }else{
            if two.1 == v{
                if two.1 == 5{
                    two.1 = 0
                }
                two.1 += 1
                if two.1 != 2{
                    giveUpMathHumans[1].1 += 1
                }
                
            }
        }
    }
    
    // 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, ...
    var three = (3,3)
    for (i,v) in answers.enumerated(){
        if i % 2 == 0 {
            if v == three.0{
                giveUpMathHumans[2].1 += 1
            }
            if three.0 == 3 {
                three.0 = 1
            }else if three.0 == 5{
                three.0 = 3
            }else {
                three.0 += 1
            }
        }else {
            if v == three.1{
                giveUpMathHumans[2].1 += 1
            }
            if three.1 == 3 {
                three.1 = 1
            }else if three.1 == 5{
                three.1 = 3
            }else{
                three.1 += 1
            }
        }
    }
    var result = [Int]()
    giveUpMathHumans.forEach{
        for (i,v) in giveUpMathHumans{
            if i == $0.0{
                continue
            }else{
                if v 
            }
        }
    }
    return result
}

print(solution1([1,2,3,4,5])) // [1]
print(solution1([1,3,2,4,2])) // [1,2,3]
