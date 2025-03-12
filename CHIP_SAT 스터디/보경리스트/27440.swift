struct Queue {
    var array = [(Int, Int)]()
    var idx = 0
    var isEmpty: Bool { idx >= array.count }

    mutating
    func enqueue(_ value: (Int, Int)) {
        array.append(value)
    }

    mutating
    func dequeue() -> (Int, Int) {
        let returnValue = array[idx]
        idx += 1

        return returnValue
    }
}

let N = Int(readLine()!)!
var queue = Queue()
var visited = Set<Int>()
queue.enqueue((N, 0))

func bfs(_ N: Int) -> Int {
    while !queue.isEmpty {
        let (current, count) = queue.dequeue()

        if current == 1 { return count }

        if !visited.contains(current - 1) {
            queue.enqueue((current - 1, count + 1))
            visited.insert(current - 1)
        }
        if current % 2 == 0 && !visited.contains(current / 2) {
            queue.enqueue((current / 2, count + 1))
            visited.insert(current / 2)
        }
        if current % 3 == 0 && !visited.contains(current / 3) {
            queue.enqueue((current / 3, count + 1))
            visited.insert(current / 3)
        }
    }

    return -1
}

print(bfs(N))