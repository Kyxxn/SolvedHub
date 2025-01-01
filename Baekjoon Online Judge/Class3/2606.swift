func dfs(_ value: Int) {
    visited[value] = true
    if value != 1 { count += 1 }

    for (idx, isExits) in array[value].enumerated() {
        if isExits && !visited[idx] {
            dfs(idx)
        }
    }
}

let N = Int(readLine()!)!
let T = Int(readLine()!)!

var array = Array(repeating: Array(repeating: false, count: N+1), count: N+1)
var visited = Array(repeating: false, count: N+1)
var count = 0
(0..<T).forEach { i in 
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let x = input[0], y = input[1]
    array[x][y] = true
    array[y][x] = true
}

dfs(1)
print(count)