let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1001)
dp[1] = 1
dp[2] = 2
dp[3] = 3
if N <= 3 {
    print(dp[N])
} else {
    (4...N).forEach { i in
        dp[i] = (dp[i - 1] + dp[i - 2]) % 10007
    }
    print(dp[N])
}