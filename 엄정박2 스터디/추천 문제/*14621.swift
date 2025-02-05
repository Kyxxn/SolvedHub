// 1530

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]
let input = readLine()!.split(separator: " ").map { String($0) }

var graph = Array(repeating: Array(repeating: 0, count: N + 1), count: N + 1)
var visited = Array(repeating: Array(repeating: false, count: N + 1), count: N + 1)
(0..<M).forEach { _ in 
    let uvd = readLine()!.split(separator: " ").map { Int($0)! }
    let u = uvd[0], v = uvd[1], d = uvd[2]
    graph[u][v] = d
    graph[v][u] = d
}

