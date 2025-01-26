func dfs(_ stack: [Int]) {
    if stack.sorted() == stack {
        print(stack.map{ String($0) }.joined(separator: " "))
        return
    }

    for next in 1...N {
        if !visited[next] {
            visited[next] = true
            dfs(stack + [next])
            visited[next] = false
        }
    }
}

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]
var visited = Array(repeating: false, count: N + 1)

dfs([])