/*
 문제 설명
 
 점심시간에 도둑이 들어, 일부 학생이 체육복을 도난당했습니다. 다행히 여벌 체육복이 있는 학생이 이들에게 체육복을 빌려주려 합니다. 학생들의 번호는 체격 순으로 매겨져 있어, 바로 앞번호의 학생이나 바로 뒷번호의 학생에게만 체육복을 빌려줄 수 있습니다. 예를 들어, 4번 학생은 3번 학생이나 5번 학생에게만 체육복을 빌려줄 수 있습니다. 체육복이 없으면 수업을 들을 수 없기 때문에 체육복을 적절히 빌려 최대한 많은 학생이 체육수업을 들어야 합니다.
 전체 학생의 수 n, 체육복을 도난당한 학생들의 번호가 담긴 배열 lost, 여벌의 체육복을 가져온 학생들의 번호가 담긴 배열 reserve가 매개변수로 주어질 때, 체육수업을 들을 수 있는 학생의 최댓값을 return 하도록 solution 함수를 작성해주세요.
 
 제한사항
 전체 학생의 수는 2명 이상 30명 이하입니다.
 체육복을 도난당한 학생의 수는 1명 이상 n명 이하이고 중복되는 번호는 없습니다.
 여벌의 체육복을 가져온 학생의 수는 1명 이상 n명 이하이고 중복되는 번호는 없습니다.
 여벌 체육복이 있는 학생만 다른 학생에게 체육복을 빌려줄 수 있습니다.
 여벌 체육복을 가져온 학생이 체육복을 도난당했을 수 있습니다. 이때 이 학생은 체육복을 하나만 도난당했다고 가정하며, 남은 체육복이 하나이기에 다른 학생에게는 체육복을 빌려줄 수 없습니다.
 
 입출력 예
 n    lost    reserve    return
 5    [2, 4]    [1, 3, 5]    5
 5    [2, 4]    [3]          4
 3    [3]       [1]          2
 입출력 예 설명
 예제 #1
 1번 학생이 2번 학생에게 체육복을 빌려주고, 3번 학생이나 5번 학생이 4번 학생에게 체육복을 빌려주면 학생 5명이 체육수업을 들을 수 있습니다.
 예제 #2
 3번 학생이 2번 학생이나 4번 학생에게 체육복을 빌려주면 학생 4명이 체육수업을 들을 수 있습니다.
 
 출처 http://hsin.hr/coci/archive/2009_2010/contest6_tasks.pdf
 */

// MARK: - First try


func solution1(_ n:Int, _ lost:[Int], _ reserve: [Int]) -> Int {
    var rentalCount = 0
    var canRentalStuNum = reserve
    for i in 1...n {
        if lost.contains(i){
            for j in 0..<canRentalStuNum.count{
                if i + 1 == reserve[j] || i - 1 == reserve[j]{
                    rentalCount += 1
                    canRentalStuNum.remove(at: j)
                }
            }
        }
    }
    
    return n - lost.count + rentalCount
}

//print(solution1(5,[2,4],[1,3,5]))


// MARK: - Second try

func solution2(_ n:Int, _ lost:[Int], _ reserve: [Int]) -> Int {
    var lostStuCount = lost.count
    
    for i in 0..<reserve.count {
        if lostStuCount == 0 {return n - lostStuCount}
        if lost.contains(reserve[i]){
            print("같은수: ", reserve[i])
            lostStuCount -= 1
            continue
        }
        if lost.contains(reserve[i] - 1) || lost.contains(reserve[i] + 1){
            print("다른수: ", reserve[i] - 1, reserve[i] + 1)
            lostStuCount -= 1
        }
    }
    
    return n - lostStuCount
}


print(solution2(5,[2,4],[1,3,5]))

// MARK: - Third try

func solution3(_ n:Int, _ lost:[Int], _ reserve: [Int]) -> Int {
    var notHaveGimSuitStu = [Int]()
    for i in 1...n{
        if !(lost.contains(i) && reserve.contains(i)){
            
            if lost.contains(i) && !reserve.contains(i + 1) {
                notHaveGimSuitStu.append(i)
            }
        }
    }
    return n - notHaveGimSuitStu.count
}


print(solution3(8,[2,3,7,8],[1,3,5]))

// MARK: - Fourth try

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


// MARK: - Firth try

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
