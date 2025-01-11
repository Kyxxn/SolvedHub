func dfs(_ value: Int) {
    visited[value] = true

    for next in map[value] {
        if !visited[next] {
            dfs(next)
        }
    }
}

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]
var map = Array(repeating: [Int](), count: N+1)
var visited = Array(repeating: false, count: N+1)
(0..<M).forEach { _ in 
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    map[input[0]].append(input[1])
    map[input[1]].append(input[0])
}

var count = 0
for i in 1...N {
    if !visited[i] {
        dfs(i)
        count += 1
    }
}

print(count)