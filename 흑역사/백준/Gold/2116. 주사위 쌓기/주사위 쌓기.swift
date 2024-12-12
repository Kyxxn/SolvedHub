// 16:30 시작
// 17:15 1트

import Foundation

let N = Int(readLine()!)!
var dice: [[Int]] = []
let mate = [0: 5, 5: 0, 1: 3, 3: 1, 2: 4, 4: 2]
for _ in 0..<N {
    dice.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var result = 0
for i in 0..<6 { // 맨 아래 도형의 6면 검토 -> 그래야 윗면이 다 다르니까 ?
    var sum = 0
    var topIndex = mate[i] // Mate[i]는 탑이 있는 인덱스를 나타냄
    var floorValue = dice[0][i]
    
    for step in 0..<N {
        var topValue = dice[step][topIndex!]
        // 뚜껑과 바닥을 제외한 최댓값을 찾아야 함
        var maxSide = 0
        for j in 0..<6 {
            if dice[step][j] != floorValue && dice[step][j] != topValue {
                maxSide = max(maxSide, dice[step][j])
            }
        }
        sum += maxSide
        
        if step < N - 1 {
            floorValue = topValue
            topIndex = mate[dice[step + 1].firstIndex(of: floorValue)!]
        }
    }

    result = max(result, sum)
}

print(result)
