//
//  main.swift
//  AlgorithmsMemo
//
//  Created by Wi on 23/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation

func solution2(_ n:Int, _ lost:[Int], _ reserve: [Int]) -> Int {
    var lostStuCount = lost.count
    var canRentalStu = reserve
    for i in 0..<canRentalStu.count {
        if lostStuCount == 0 {return n - lostStuCount}
        if lost.contains(reserve[i]){
            print("같은수: ", canRentalStu[i])
            canRentalStu.removeFirst()
            lostStuCount -= 1
            continue
        }else if (lost.contains(reserve[i] - 1) || lost.contains(reserve[i] + 1)) && canRentalStu.contains(reserve[i]){
            print("다른수: ", reserve[i])
            canRentalStu.removeFirst()
            lostStuCount -= 1
        }
    }
    return n - lostStuCount
}


print(solution2(10,[2,4,7,8,9],[1,3,5]))

