func dfs(_ depth: Int) {
    if depth == M {
        print(stack.map { String($0) }.joined(separator: " "))
        return
    }

    for next in 1...N {
        if !visited[next] {
            visited[next] = true
            stack.append(next)
            dfs(depth + 1)
            visited[next] = false
            stack.removeLast()
        }
    }
}

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]
var visited = Array(repeating: false, count: N + 1)
var stack = [Int]()
dfs(0)