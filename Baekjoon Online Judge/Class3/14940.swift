func bfs() {
    while !queue.isEmpty {
        let (x, y, count) = queue.removeFirst()
        result[x][y] = count
        visited[x][y] = true

        for i in 0..<4 {
            let newX = x + dx[i], newY = y + dy[i]
            if 0 <= newX, newX < n, 0 <= newY, newY < m {
                if !visited[newX][newY], map[newX][newY] == 1 {
                    visited[newX][newY] = true
                    queue.append((newX, newY, count + 1))
                }
            }
        }
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
let dx = [0, 0, -1, 1], dy = [-1, 1, 0, 0]
var map = Array(repeating: [Int](), count: n)
var result = Array(repeating: Array(repeating: 0, count: m), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
(0..<m).forEach {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    map[$0].append(contentsOf: input)
}

var queue = [(Int, Int, Int)]()
for i in 0..<n {
    for j in 0..<m {
        if map[i][j] == 2 {
            queue.append((i, j, 0))
        } else if map[i][j] == 0 {
            result[i][j] = 0
        }
    }
}
bfs()

result.forEach {
    print($0.map { String($0) }.joined(separator: " "))
}