func bfs() {
    var index = 0
    while index < queue.count {
        let v = queue[index]
        let currentV = v.0
        let count = v.1

        if currentV == K {
            print(count)
            break
        }

        let nextPositions = [currentV - 1, currentV + 1, currentV * 2]
        for next in nextPositions {
            if 0 <= next, next <= 100000, !visited[next] {
                visited[next] = true
                queue.append((next, count + 1))
            }
        }
        index += 1
    }
}

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0], K = NK[1]

var queue = [(N, 0)]
var visited = Array(repeating: false, count: 100001)

visited[N] = true
bfs()