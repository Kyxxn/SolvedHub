func factorial(_ n: Int) -> Int {
    if n < 2 {
        return 1
    }
    return n * factorial(n - 1)
}

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0], K = NK[1]
print(factorial(N) / (factorial(N - K) * factorial(K)))