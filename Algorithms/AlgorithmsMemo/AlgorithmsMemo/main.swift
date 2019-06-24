//
//  main.swift
//  AlgorithmsMemo
//
//  Created by Wi on 23/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation

func solution3(_ n:Int, _ lost:[Int], _ reserve: [Int]) -> Int {
    var notHaveGimSuitStu = [Int]()
    for i in 1...n{
        if !(lost.contains(i) && reserve.contains(i)){
            if lost.contains(i) && !reserve.contains(i + 1) {
                if !reserve.contains(i - 1){
                    notHaveGimSuitStu.append(i)
                    print(notHaveGimSuitStu)
                }
                print(notHaveGimSuitStu, i)
            }
        }
    }
    return n - notHaveGimSuitStu.count
}


//print(solution2(30,[2,3,25,7,8,11,12,18],[1,24,3,5]))

print(solution3(5, [2,4], [3]))
