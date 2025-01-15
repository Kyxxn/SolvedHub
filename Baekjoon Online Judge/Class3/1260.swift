struct Queue {
    var queue = [Int]()
    var index = 0

    var isEmpty: Bool {
        return index >= queue.count
    }

    mutating
    func enqueue(_ v: Int) {
        queue.append(v)
    }

    mutating
    func dequeue() -> Int {
        let returnValue = queue[index]
        index += 1
        return returnValue
    }
}

func dfs(_ v: Int) {
    visited[v] = true

    for (idx, isTrue) in map[v].enumerated() {
        if isTrue && !visited[idx] {
            output += " \(idx)"
            dfs(idx)
        }
    }
}

func bfs() {
    while !queue.isEmpty {
        let v = queue.dequeue()
        visited[v] = true
        
        for (idx, isTrue) in map[v].enumerated() {
            if isTrue && !visited[idx] {
                visited[idx] = true
                output += " \(idx)"
                queue.enqueue(idx)
            }
        }
    }
}

let NMV = readLine()!.split(separator: " ").map { Int($0)! }
let N = NMV[0], M = NMV[1], V = NMV[2]

var map = Array(repeating: Array(repeating: false, count: N + 1), count: N + 1)
var visited = Array(repeating: false, count: N + 1)
(0..<M).forEach { _ in 
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let x = input[0], y = input[1]
    map[x][y] = true
    map[y][x] = true
}

// dfs
var output = "\(V)"
dfs(V)
print(output)

// bfs
output = "\(V)"
visited = Array(repeating: false, count: N + 1)
var queue = Queue()
queue.enqueue(V)

bfs()
print(output)