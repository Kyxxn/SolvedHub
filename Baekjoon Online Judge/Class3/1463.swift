let N = Int(readLine()!)!
if N == 1 { print(0) }
else if N == 2 { print(1) }
else if N == 3 { print(1) }
else {
    var dp = Array(repeating: 0, count: N + 1)
    dp[1] = 0
    dp[2] = 1
    dp[3] = 1

    for i in 4...N {
        let minusOne = dp[i - 1] + 1
        var current = Int.max
        if i % 2 == 0 {
            current = dp[i / 2] + 1
        } else if i % 3 == 0 {
            current = dp[i / 3] + 1
        }
        dp[i] = min(minusOne, current)
    }
    print(dp[N])
}