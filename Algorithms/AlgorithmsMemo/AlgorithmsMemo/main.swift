//
//  main.swift
//  AlgorithmsMemo
//
//  Created by Wi on 23/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation

func solution(_ land:[[Int]]) -> Int{
    var answer = 0
    var beforeTuple = (0,0)
    var afterTuple = (0,0)
    // 배열 안의 배열을 꺼내오기
    for i in land{
        var arr = i
        var num = 0
        beforeTuple = afterTuple
        for (n,v) in i.enumerated(){
            if num < v{
                num = v
                afterTuple = (n,v)
            }
        }
        
        if beforeTuple != (0,0) && afterTuple.0 == beforeTuple.0 {
            var num = 0
            arr.remove(at: afterTuple.0)
            print(arr)
            for (n,v) in arr.enumerated(){
                if num < v{
                    num = v
                    afterTuple = (n,v)
                }
            }
        }
        
        answer += afterTuple.1
        
        print(beforeTuple,afterTuple)
    }
    print(answer)
    return answer
}

//[[7,6,5,4]
//,[8,5,3,1]
//,[3,4,5,6]]


//[[1,2,3,5]
//,[5,6,7,8]
//,[4,3,2,1]]


solution([[7,6,5,4],[8,5,3,1],[3,4,5,6]])
solution([[1,2,3,5],[5,6,7,8],[4,3,2,1]])

