//  39분: 부분점수 50점
//  답지 봄
//  46분: 정답


import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)! // S 길이
let S: [Character] = readLine()!.map{ $0 }

var idx = 0
var ioiCount = 0
var answer = 0

while idx < M-2 {
    if String(S[idx...idx+2]) == "IOI" {
        idx += 2
        ioiCount += 1
        
        if ioiCount == N {
            answer += 1
            ioiCount -= 1
        }
    }else {
        idx += 1
        ioiCount = 0
    }
}

print(answer)
