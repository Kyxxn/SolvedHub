// 12:29 시작
// 12:36 인풋 정리
// 12:52 끝
// 12:54 75%에서 시간초과 뜸, 인풋처리는 문제 X
// 12:57 누적합 문제임을 알게 됨

import Foundation

let rcq = readLine()!.split(separator: " ").map { Int(String($0))! }
let R = rcq[0], C = rcq[1], Q = rcq[2]
var arr: [[Int]] = []

for _ in 0..<R {
    let rc = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append(rc)
}

// 누적 합 배열 생성
var prefixSum = Array(repeating: Array(repeating: 0, count: C + 1), count: R + 1)

for i in 1...R {
    for j in 1...C {
        prefixSum[i][j] = arr[i-1][j-1] + prefixSum[i-1][j] + prefixSum[i][j-1] - prefixSum[i-1][j-1]
    }
}

for _ in 0..<Q {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let r1 = input[0], c1 = input[1], r2 = input[2], c2 = input[3]
    
    let total = prefixSum[r2][c2] - prefixSum[r1-1][c2] - prefixSum[r2][c1-1] + prefixSum[r1-1][c1-1]
    let count = (r2 - r1 + 1) * (c2 - c1 + 1)
    print(total / count)
}

//for i in 0..<Q {
//    var sum = 0
//    var count = 0
//    let r1 = rcrc[i][0] - 1, r2 = rcrc[i][2] - 1
//    let c1 = rcrc[i][1] - 1, c2 = rcrc[i][3] - 1
//    
//    for j in r1...r2 {
//        for k in c1...c2 {
//            sum += arr[j][k]
//            count += 1
//        }
//    }
//    
//    count == 0 ? print(sum / 1) : print(sum / count)
//}
