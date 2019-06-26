//
//  main.swift
//  AlgorithmsMemo
//
//  Created by Wi on 23/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation

func solution5(_ n:Int, _ lost:[Int], _ reserve: [Int]) -> Int {
    var haveGimSuitStu = [Int]()
    var checkReserve = [Int]()
    for i in 1...n {
        if lost.contains(i) && reserve.contains(i){
            haveGimSuitStu.append(i)
            checkReserve.append(i)
        }
    }
    for i in 1...n{
        if checkReserve.contains(i){continue}
        if !lost.contains(i){
            haveGimSuitStu.append(i)
        }else if reserve.contains(i){
            haveGimSuitStu.append(i)
        }else if !checkReserve.contains(i + 1) && reserve.contains(i + 1){
            checkReserve.append(i + 1)
            haveGimSuitStu.append(i)
        }else if !checkReserve.contains(i - 1) && reserve.contains(i - 1){
            checkReserve.append(i - 1)
            haveGimSuitStu.append(i)
        }
    }
    for i in checkReserve{
        if !haveGimSuitStu.contains(i){
            haveGimSuitStu.append(i)
        }
    }
    return haveGimSuitStu.count
}

print(solution5(24, [12, 13, 16, 17, 19, 20, 21, 22], [1, 22, 16, 18, 9, 10]))

//print(solution5(30,[2,3,4,25,7,27,28,8,11,12,18],[1,24,26,4,3,5]))
////
//print(solution5(5, [2,4],[3]))
//
//print(solution5(10, [2,4,7,8,9], [1,3,5]))
// 12 13 20  missing

