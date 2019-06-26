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
    
    // 1
    for i in 1...5{
        if answers[i - 1] == i {
            giveUpMathHumans[0].1 += 1
        }
    }
    // 2
    var two = (2,1)
    for (i, v) in answers.enumerated(){
        if answers[i] % 2 == 0 {
            if two.0 == v{
                giveUpMathHumans[1].1 += 1
                print(v)
            }
        }else{
            if two.1 == v{
                if two.1 == 5{
                    two.1 = 0
                }
                giveUpMathHumans[1].1 += 1
                print(v)
                two.1 += 1
            }
        }
    }
    
    return giveUpMathHumans.map{$0.1}.sorted().reversed()
}

print(solution1([1,2,3,4,5])) // [1]
print(solution1([1,3,2,4,2])) // [1,2,3]
