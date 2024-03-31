import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)! // S 길이
let S: String = readLine()!
var answer = 0
var standard: String = "I"
for _ in 0..<N {
    standard.append("OI")
}

for i in 0..<M {
    if S[S.index(S.startIndex, offsetBy: i)] == "I" {
        if i + standard.count > M {
            break
        }
        
        let start = S.index(S.startIndex, offsetBy: i)
        let end = S.index(start, offsetBy: standard.count)
        if S[start..<end] == standard {
            answer += 1
        }
    }
}

print(answer)
