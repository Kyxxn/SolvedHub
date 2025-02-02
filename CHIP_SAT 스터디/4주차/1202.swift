struct MaxHeap {
    var heap = [(Int, Int)]()
    var isEmpty: Bool { heap.isEmpty }

    mutating func insert(_ value: (Int, Int)) {
        heap.append(value)
        var currentIndex = heap.count - 1
        while currentIndex > 0 {
            let parentIndex = (currentIndex - 1) / 2
            if heap[currentIndex].0 > heap[parentIndex].0 {
                heap.swapAt(currentIndex, parentIndex)
                currentIndex = parentIndex
            } else {
                break
            }
        }
    }

    mutating func pop() -> (Int, Int)? {
        guard !heap.isEmpty else { return nil }
        heap.swapAt(0, heap.count - 1)
        let returnValue = heap.removeLast()
        moveDown(0)
        return returnValue
    }

    mutating func moveDown(_ index: Int) {
        var swapIndex = index
        let left = 2 * index + 1
        let right = 2 * index + 2

        if left < heap.count && heap[left].0 > heap[swapIndex].0 {
            swapIndex = left
        }

        if right < heap.count && heap[right].0 > heap[swapIndex].0 {
            swapIndex = right
        }

        if swapIndex != index {
            heap.swapAt(index, swapIndex)
            moveDown(swapIndex)
        }
    }
}

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0], K = NK[1]

var jewels = [(Int, Int)]()
(0..<N).forEach { _ in 
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    jewels.append((input[0], input[1]))
}
jewels.sort { $0.0 < $1.0 }

var bags = [Int]()
(0..<K).forEach { _ in 
    bags.append(Int(readLine()!)!)
}
bags.sort()

var maxHeap = MaxHeap()
var sum = 0
var jewelIndex = 0

for bagWeight in bags {
    while jewelIndex < N && jewels[jewelIndex].0 <= bagWeight {
        maxHeap.insert((jewels[jewelIndex].1, jewels[jewelIndex].0)) // (가격, 무게) 삽입
        jewelIndex += 1
    }

    if let mostExpensive = maxHeap.pop() {
        sum += mostExpensive.0
    }
}

print(sum)