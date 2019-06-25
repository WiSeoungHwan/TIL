//
//  main.swift
//  AlgorithmsMemo
//
//  Created by Wi on 23/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation

func solution4(_ n:Int, _ lost:[Int], _ reserve: [Int]) -> Int {
    var haveGimSuitStu = [Int]()
    for i in 1...n{
        if lost.contains(i) && reserve.contains(i){
            haveGimSuitStu.append(i)
            continue
        }
        
        if !lost.contains(i){
            haveGimSuitStu.append(i)
        }else if reserve.contains(i){
            haveGimSuitStu.append(i)
        }else if !haveGimSuitStu.contains(i) && reserve.contains(i + 1){
            haveGimSuitStu.append(i)
        }else if reserve.contains(i - 1){
            haveGimSuitStu.append(i)
        }
        else {
            print("else: \(i)")
        }
        print(haveGimSuitStu)
    }
    return haveGimSuitStu.count
}


print(solution4(30,[2,3,25,7,8,11,12,18],[1,24,3,5]))

print(solution4(5, [2,4],[3]))
//
//print(solution3(8, [2,3,7,8], [1,3,5]))
