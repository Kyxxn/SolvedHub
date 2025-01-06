let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]
let array = readLine()!.split(separator: " ").map { Int($0)! }
var dp = [0]
for (idx, value) in array.enumerated() {
    dp.append(value + dp[idx])
}

(0..<M).forEach { _ in 
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let startIdx = input[0], endIdx = input[1]
    print(dp[endIdx] - dp[startIdx - 1])
}