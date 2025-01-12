struct O1Queue {
    var queue = [(Int, Int, Int)]()
    var index = 0
    var isEmpty: Bool { index >= queue.count }

    mutating
    func append(_ value: (Int, Int, Int)) {
        queue.append(value)
    }

    mutating
    func removeFirst() -> (Int, Int, Int) {
        defer { index += 1 }
        return queue[index]
    }
}

func bfs() {
    for i in 0..<N {
        for j in 0..<M {
            if tomatoField[i][j] == 1 {
                queue.append((i, j, 0))
            }
        }
    }

    while !queue.isEmpty {
        let popTomato = queue.removeFirst()
        let x = popTomato.0
        let y = popTomato.1
        visited[x][y] = true

        for idx in 0..<4 {
            let nextX = dx[idx] + x, nextY = dy[idx] + y
            if 0 <= nextX, nextX < N && 0 <= nextY, nextY < M {
                if !visited[nextX][nextY] && tomatoField[nextX][nextY] == 0 {
                    queue.append((nextX, nextY, popTomato.2 + 1))
                    tomatoField[nextX][nextY] = 1
                    maxValue = max(maxValue, popTomato.2 + 1)
                }
            }
        }
    }
}

let MN = readLine()!.split(separator: " ").map { Int($0)! }
let M = MN[0], N = MN[1]
let dx = [0, 0, -1, 1], dy = [-1, 1, 0, 0]
var tomatoField = Array(repeating: [Int](), count: N)
var visited = Array(repeating: Array(repeating: false, count: M), count: N)
(0..<N).forEach {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    tomatoField[$0] = input
}

var queue = O1Queue()
var maxValue = 0
bfs()

var isYami = true
for i in 0..<N {
    if tomatoField[i].contains(0) { isYami = false }
}

print(isYami ? maxValue : -1)