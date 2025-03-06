// 시작 1056
// 문제이해 1058
// 첫 제출 1111 -> 답틀림, 메모리 초과, 파라미터로 넘겨주지 않고 전역변수 활용하자
// 다시 풀기 1310
// 두 번째 제출 1336 -> 답은 맞는데, 메모리 초과
// 세 번째 제출 1345 -> Set 메모리가 터지는 거 같아서 Set 제거하고 count만 관리했으나 시간초과 발생

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]
var dp = Array(repeating: 0, count: 10001)
dp[0] = 1

for i in 1..<10001 {
    dp[i] = dp[i - 1] // A를 쓰는 경우

    if i - M >= 0 {
        dp[i] = (dp[i] + dp[i - M]) % 1000000007
    }
}
print(dp[0...5])
print(dp[N])