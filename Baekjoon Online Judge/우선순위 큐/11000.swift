struct PQ<T: Comparable> {
    var heap = [T]()
    
    var isEmpty: Bool { heap.isEmpty }
    var count: Int { heap.count }
    var peek: T? { heap.first }

    mutating
    func push(_ value: T) {
        heap.append(value)
        moveUp(heap.count - 1)
    }

    mutating
    func moveUp(_ index: Int) {
        var child = index
        var parent = (child - 1) / 2
        while child > 0 && heap[child] < heap[parent] {
            heap.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    mutating
    func pop() -> T? {
        guard !heap.isEmpty else { return nil }
        heap.swapAt(0, heap.count - 1)
        let returnValue = heap.removeLast()
        moveDown(0)

        return returnValue
    }

    mutating
    func moveDown(_ index: Int) {
        let left = index *  2 + 1
        let right = index * 2 + 2
        var swapIndex = index

        if left < heap.count && heap[left] < heap[swapIndex] {
            swapIndex = left
        }

        if right < heap.count && heap[right] < heap[swapIndex] {
            swapIndex = right
        }

        if swapIndex != index {
            heap.swapAt(swapIndex, index)
            moveDown(swapIndex)
        }
    }
}

var lectures = [(Int, Int)]()
var pq = PQ<Int>()
let N = Int(readLine()!)!

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    lectures.append((start: input[0], end: input[1]))
}
lectures.sort { $0.0 < $1.0 }

for lecture in lectures {
    if let earlyTime = pq.peek, earlyTime <= lecture.0 {
        pq.pop()
    }

    pq.push(lecture.1)
}
print(pq.count)