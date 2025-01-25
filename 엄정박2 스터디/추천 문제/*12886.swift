func dfs(_ a: Int, _ b: Int, _ c: Int) {
    guard !visited[a][b] else { return }
    visited[a][b] = true

    if a == b, b == c {
        result = 1
        return        
    }

    let stones = [a, b, c]
    for i in 0..<3 {
        for j in 0..<3 {
            if stones[i] > stones[j] {
                dfs(stones[i] - stones[j], stones[j] * 2, sum - stones[i] - stones[j])
            }
        }
    }
}

let ABC = readLine()!.split(separator: " ").map { Int($0)! }
let A = ABC[0], B = ABC[1], C = ABC[2]
let sum = A + B + C
var visited = Array(repeating: Array(repeating: false, count: 1501), count: 1501)
var result = 0

dfs(A, B, C)
print(result)